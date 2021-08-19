#!/bin/bash

git config --local filter.kicad_project.clean "sed -E 's/^update=.*$/update=Date/'"
git config --local filter.kicad_project.smudge cat
git config --local filter.kicad_sch.clean "sed -E 's/#(PWR|FLG)[0-9]+/#\1?/'"
git config --local filter.kicad_sch.smudge cat
