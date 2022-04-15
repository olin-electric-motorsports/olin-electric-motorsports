import os
from flask import Flask, render_template, request
from jinja2 import Template
import re
import sqlite3

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

#Initializes Flask App
app = Flask(__name__)

#Nested Dictionary that stores information on every commit for a board
#Each commit includes a link to a schematic, layout, and bom
data = {}

#Defines each route of the flask app
#Home page lists each OEM PCB with a commit in github, links to the specific 
#board page
@app.route('/test_html', methods=['GET'])
def dropdown():
    colours = ['Red', 'Blue', 'Black', 'Orange']
    return render_template('test.html', colours=colours)

@app.route('/', methods = ['POST', 'GET'])
def TableOfContents():
    if request.method == 'POST':
        if not os.path.exists("database.db"):
            conn = sqlite3.connect('database.db')
            conn.execute("CREATE TABLE kicad_artifacts (board_name TEXT, commits TEXT, schematic TEXT, layout TEXT, bom TEXT)")
            conn.close()
        postRequest = request.get_json()
        buildable_list = postRequest['buildable_list'][0].split(" ")
        commit_number = postRequest['commit_number']
        buildable_list.sort()
        current_board_counter = 0

        while current_board_counter < len(buildable_list):
            current_board_name = re.split('//|/|:', buildable_list[current_board_counter])[-2]
            layout_link = "https://oem-outline.nyc3.digitaloceanspaces.com/kicad-artifacts/" + buildable_list[current_board_counter+2].replace(":", "/")[2:]
            schematic_link = "https://oem-outline.nyc3.digitaloceanspaces.com/kicad-artifacts/" + buildable_list[current_board_counter+1].replace(":", "/")[2:]
            bom_link = "https://oem-outline.nyc3.digitaloceanspaces.com/kicad-artifacts/" + buildable_list[current_board_counter].replace(":", "/")[2:]
            
            with sqlite3.connect("database.db") as con:
                cur = con.cursor()
                cur.execute("INSERT INTO kicad_artifacts (board_name,commits,schematic,layout,bom) VALUES (?,?,?,?,?)",(current_board_name,commit_number,schematic_link,layout_link,bom_link))
                con.commit()
            current_board_counter += 5
        con.row_factory = sqlite3.Row
        cur.execute("select * from kicad_artifacts")
        rows = cur.fetchall()
        return "Website Updated!"
        con.close()
    if request.method == 'GET':
        if not os.path.exists("database.db"):
            conn = sqlite3.connect('database.db')
            conn.execute("CREATE TABLE kicad_artifacts (board_name TEXT, commits TEXT, schematic TEXT, layout TEXT, bom TEXT)")
            conn.close()
        con = sqlite3.connect("database.db")
        con.row_factory = sqlite3.Row
        cur = con.cursor()
        cur.execute("select * from kicad_artifacts")
        rows = cur.fetchall()
        artifacts = {}
        for row in rows:
            if row[0] not in artifacts.keys():
                artifacts[row[0]] = [{row[1]: [row[2], row[3], row[4]]}]
            else:
                artifacts[row[0]].insert(0, {row[1]: [row[2], row[3], row[4]]})
        return render_template('tableofcontents.html', artifacts=artifacts)
#Displays a list of commits for a specified PCB, each commit links to a page
#that displays information on each commit
@app.route('/<board_name>/')
def board_name(board_name):
    commits = []

    con = sqlite3.connect("database.db")
    con.row_factory = sqlite3.Row
    cur  = con.cursor()
    cur.execute("select * from kicad_artifacts")
    rows = cur.fetchall()
    for row in rows:
        if row[0] == board_name:
            commits.append(row[1])
    return render_template('board.html', board_name=board_name, commits=commits)
#Displays the layout, schematic, and bom of a specified commit
#If a POST request is sent to this site, a new commit is added to the nested
#dictionary, where the data of the POST are links to the layout, schematic,
#and bom
@app.route('/<board_name>/<commit>', methods = ['POST', 'GET'])
def board_name_commit(board_name,commit):
    con = sqlite3.connect("database.db")
    con.row_factory = sqlite3.Row
    cur  = con.cursor()
    cur.execute("select * from kicad_artifacts")
    rows = cur.fetchall()
    for row in rows:
        if row[0] == board_name and row[1] == commit:
            schematic = row[2]
            layout = row[3]
            bom = row[4]
    return render_template('board_commit.html', board_name=board_name, commit=commit, schematic = schematic, layout = layout, bom = bom)

#runs the app
if __name__ == "__main__":
    app.run()

