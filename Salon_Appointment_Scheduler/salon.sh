#! /bin/bash
# Salon Appointment Scheduler

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\nWelcome to the Salon Appointment Scheduler\n"

# choose service
SERVICE_NAME=""
SERVICES=$($PSQL "SELECT * FROM services")
while [[ -z $SERVICE_NAME ]]
do
  echo -e "\nChoose a service"
  echo "$SERVICES" | while read ID BAR NAME
  do
    echo "$ID) $NAME"
  done
  read SERVICE_ID_SELECTED
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
done
echo -e "\nYou chose$SERVICE_NAME"

# read CUSTOMER_PHONE, CUSTOMER_NAME, and SERVICE_TIME
echo -e "\nEnter your phone number"
read CUSTOMER_PHONE
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

# if not found
if [[ -z $CUSTOMER_ID ]]
then
  echo -e "\nYour phone number is not registered yet.\nEnter your name"
  read CUSTOMER_NAME
  REGISTER_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
fi

echo -e "\nChoose a time for the appointment"
read SERVICE_TIME
SCHEDULE_APPONTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED,'$SERVICE_TIME')")

echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
