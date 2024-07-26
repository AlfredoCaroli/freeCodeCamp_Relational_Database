#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --no-align -c"
secret_number=$(( RANDOM % 1000 + 1 ))
guess_count=0
guessed=FALSE

echo Enter your username:
read username

user_id=$($PSQL "SELECT user_id FROM users WHERE username='$username'")

if [[ -z $user_id ]]
then
    echo "Welcome, $username! It looks like this is your first time here."
	
    insert_user=$($PSQL "INSERT INTO users(username) VALUES('$username')")
    
else
	games_played=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$user_id")
	
	best_game=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE user_id=$user_id")

	echo "Welcome back, "$username"! You have played "$games_played" games, and your best game took "$best_game" guesses."
fi

echo Guess the secret number between 1 and 1000:
read guess

while [[ $guessed == FALSE ]]
do 
	if [[ ! $guess =~ ^[0-9]+$ ]]
  then
		echo -e "That is not an integer, guess again:"
		read guess
		((guess_count++))
    
	else
		# if target is higher
		if [[ $guess < $secret_number ]]
		then
			echo "It's higher than that, guess again:"
			read guess
			((guess_count++))
			
		# if target is lower
		elif [[ $guess > $secret_number ]]
    then
			echo "It's lower than that, guess again:"
			read guess
			((guess_count++))
			
		# if user guesses
		else
			guessed=TRUE
			((guess_count++))
		fi  
	fi

done

user_id=$($PSQL "SELECT user_id FROM users WHERE username='$username'")

insert_game=$($PSQL "INSERT INTO games(user_id, secret_number, number_of_guesses) VALUES($user_id, $secret_number, $guess_count)")

echo "You guessed it in $guess_count tries. The secret number was $secret_number. Nice job!"
