#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"

atomic_number=''

if [[ -z $1 ]]; then

    echo Please provide an element as an argument.

elif [[ $1 =~ ^[0-9]+$ ]]; then

	atomic_number=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")

	if [[ -z $atomic_number ]]; then
                echo "I could not find that element in the database."
        fi

elif [[ $1 =~ ^[a-zA-Z]{1}$ || $1 =~ ^[a-zA-Z]{2}$ ]]; then

	atomic_number=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'")

	if [[ -z $atomic_number ]]; then
        	echo "I could not find that element in the database."
    	fi

else
	atomic_number=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1'")

	if [[ -z $atomic_number ]]; then
                echo "I could not find that element in the database."
        fi
fi

if [[ $atomic_number ]]; then
	name=$($PSQL "SELECT name FROM elements WHERE atomic_number=$atomic_number")
	symbol=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$atomic_number")
	type=$($PSQL "SELECT type FROM elements e JOIN properties p ON e.atomic_number = p.atomic_number JOIN types t ON p.type_id =
	t.type_id WHERE e.atomic_number=$atomic_number")
	atomic_mass=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$atomic_number")
	melting=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$atomic_number")
	boiling=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$atomic_number")
	echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting celsius and a boiling point of $boiling celsius."
fi
