import os
from flask import Flask, render_template, request
from jinja2 import Template
import sqlite3
import numpy as np

"""
USER GUIDE:
Site Structure:
Homepage lists each OEM PCB and hyperlinks to each individual PCB page
Each PCB site has a list of commits, that hyperlink to sites that display information about those commits
Each commit page has links to the layout, schematic, and bom of the commit
Each individual site calls upon a separate html template from the templates folder to display information
To update the site, a post request is sent to the localhost:5000/<board_name>/<commit> webpage, where
the stored data of the site can be updated and displayed
To run the webpage on ubuntu, install flask and in the terminal run:
export FLASK_APP=board_information.py
flask run
and then navigate to the localhost:5000/ site on your machine's browser
"""

# Initializes Flask App
app = Flask(__name__)

# Defines each route of the flask app
# Home page lists each OEM PCB with a commit in github, links to the specific
# board page
@app.route("/test_html", methods=["GET"])
def dropdown():
    colours = ["Red", "Blue", "Black", "Orange"]
    return render_template("test.html", colours=colours)


@app.route("/", methods=["POST", "GET"])
def Home():
    if request.method == "POST":
        if not os.path.exists("database.db"):
            conn = sqlite3.connect("database.db")
            conn.execute(
                "CREATE TABLE kicad_artifacts (board_name TEXT, commits TEXT, schematic TEXT, ibom TEXT)"
            )
            conn.close()
        postRequest = request.get_json()
        updated_board_files = postRequest["updated_board_files"].split("//")[1:]
        commit_hash = postRequest["commit_hash"]
        updated_board_files = np.reshape(
            sorted(updated_board_files), [int(len(updated_board_files) / 2), 2]
        )

        for curr_ibom, curr_schematic in updated_board_files:
            curr_board_name = ".".join((curr_ibom.split("/")[3:-1]))
            curr_schematic_link = (
                "https://oem-outline.nyc3.digitaloceanspaces.com/kicad-artifacts/"
                + curr_schematic
            )
            curr_ibom_link = (
                "https://oem-outline.nyc3.digitaloceanspaces.com/kicad-artifacts/"
                + curr_ibom
            )

            with sqlite3.connect("database.db") as con:
                cur = con.cursor()
                cur.execute(
                    "INSERT INTO kicad_artifacts (board_name,commits,schematic,ibom) VALUES (?,?,?,?)",
                    (curr_board_name, commit_hash, curr_schematic_link, curr_ibom_link),
                )
                con.commit()

        con.row_factory = sqlite3.Row
        cur.execute("select * from kicad_artifacts")
        rows = cur.fetchall()
        return "Website Updated!"
    if request.method == "GET":
        if not os.path.exists("database.db"):
            conn = sqlite3.connect("database.db")
            conn.execute(
                "CREATE TABLE kicad_artifacts (board_name TEXT, commits TEXT, schematic TEXT, ibom TEXT)"
            )
            conn.close()
        con = sqlite3.connect("database.db")
        con.row_factory = sqlite3.Row
        cur = con.cursor()
        cur.execute("select * from kicad_artifacts")
        rows = cur.fetchall()
        artifacts = {}
        for row in rows:
            if row[0] not in artifacts.keys():
                artifacts[row[0]] = [{row[1]: [row[2], row[3]]}]
            else:
                artifacts[row[0]].insert(0, {row[1]: [row[2], row[3]]})
        for key, value in artifacts.items():
            most_recent_board = value[0]
            most_recent_commit = list(most_recent_board)[0]
            print(most_recent_commit)
            artifacts[key][0] = {
                most_recent_commit + " (Current Version)": value[0][most_recent_commit]
            }
            print(artifacts[key])
        return render_template("home.html", artifacts=artifacts)


# Displays a list of commits for a specified PCB, each commit links to a page
# that displays information on each commit
@app.route("/<board_name>/")
def board_name(board_name):
    con = sqlite3.connect("database.db")
    con.row_factory = sqlite3.Row
    cur = con.cursor()
    cur.execute("select * from kicad_artifacts")
    rows = cur.fetchall()
    files_by_commit = {}
    board_counter = 0
    for row in rows:
        if row[0] == board_name:
            files_by_commit[row[1]] = [board_counter, row[2], row[3]]
            board_counter += 1
    if files_by_commit != {}:
        return render_template(
            "board.html", board_name=board_name, files_by_commit=files_by_commit
        )
    return render_template("error.html")


# Displays the layout, schematic, and bom of a specified commit
# If a POST request is sent to this site, a new commit is added to the nested
# dictionary, where the data of the POST are links to the layout, schematic,
# and bom
@app.route("/<board_name>/<commit>", methods=["POST", "GET"])
def board_name_commit(board_name, commit):
    con = sqlite3.connect("database.db")
    con.row_factory = sqlite3.Row
    cur = con.cursor()
    cur.execute("select * from kicad_artifacts")
    rows = cur.fetchall()
    for row in rows:
        if row[0] == board_name and row[1] == commit:
            schematic = row[2]
            bom = row[3]
            return render_template(
                "board_commit.html",
                board_name=board_name,
                commit=commit,
                schematic=schematic,
                bom=bom,
            )
    return render_template("error.html")


# runs the app
if __name__ == "__main__":
    app.run()
