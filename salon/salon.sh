#! /bin/bash

echo  -e "\n~~~~~ MY SALON ~~~~~\n"

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c "

echo -e "\nWelcome to My Salon, how can I help you?\n"

MAIN_MENU() {
  
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  
  SERVICES=$($PSQL "SELECT service_id, name FROM services;")

  echo "$SERVICES"  | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  read SERVICE_ID_SELECTED

  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU 'I could not find that service. What would you like today?'
  else
    
    SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    if [[ -z $SERVICE_ID ]]
    then
      MAIN_MENU 'I could not find that service. What would you like today?'
    else
      
      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID")
      # ask for phone number
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE

      while [[ -z $CUSTOMER_PHONE ]]
        do
          echo "Phone cannot be empty. Try again."
          read CUSTOMER_PHONE
        done

      # check if person exist
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    
      #if person doesnt exist create it
      if [[ -z $CUSTOMER_ID ]]
      then
        #create
        echo "I don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        
        while [[ -z $CUSTOMER_NAME ]]
        do
          echo "Name cannot be empty. Try again."
          read CUSTOMER_NAME
        done
        CUSTOMER_INSERT_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      else
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID")
      fi

      # ask for time
      SERVICE_NAME_FORMATTED="$(echo $SERVICE_NAME | sed -E 's/^ *| *$//g')"
      CUSTOMER_NAME_FORMATTED="$(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')"
      echo "What time would you like your $SERVICE_NAME_FORMATTED, $CUSTOMER_NAME_FORMATTED?"
      read SERVICE_TIME

      INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")
      echo -e "\nI have put you down for a $SERVICE_NAME_FORMATTED at $SERVICE_TIME, $CUSTOMER_NAME_FORMATTED."

    fi
    
  fi
  
  

}


MAIN_MENU