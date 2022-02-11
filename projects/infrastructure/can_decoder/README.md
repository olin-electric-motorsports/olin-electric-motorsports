This is a command line interface that lets you decode and search CAN csv files. To see the different commands and inputs run:
>python cli.py --help

While decoding there are two different functions that can be run.
If you want to decode while being given live input run:
>python cli.py --dbc yourdbc.dbc --decode_csv_live

This will take csv values and print the decoded version in the terminal.

If you want to decode a whole file run:
>python cli.py --dbc yourdbc.dbc --csv yourcsv.csv --new_file name.txt

This will take a whole csv, decode it and give you a file with the name given in json format.

