# ART Metadata Server

This is an application for managing metadata used by the
[ART](https://github.com/HISMalawi/BHT-EMR-API) application. Specifically this
application is used to manage ARV regimen combinations and dosages.

## Requirements

- Ruby 2.5.7+
- Ruby bundler 2.1.4+
- BHT-EMR-API database

## Setting up

1. Database Setup:

   This application requires an ART database that has the new (as of July 2020)
   regimen tables. Currently, to get those tables in ART, one has to do the
   following in BHT-EMR-API:
   
     ```bash

       $ git fetch

       $ git checkout refactor/patient_current_regimen
       
       $ rails db:migrate

       $ sudo mysql bht_emr_dev < db/sql/patient_current_regimen.sql

     ```

   NOTE: The above command assumes the application's database
   is named `bht_emr_dev`.

2. Application setup:

   - Copy config/database.yml.example to config/database.yml then edit it to
     point to the BHT-EMR-API database.
   - Run the following commands to finish the setup:

   ```bash

    $ bundle install

   ```

## Running the application

Run the following to start the application:

```bash

  $ rails s

```