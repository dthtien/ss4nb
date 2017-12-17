# Suport system for new buyer
rDBMS: [postgresql](https://www.postgresql.org/) 
- Step 1: Install rails(skip this step if your pc already had rails)
  [Install rails](https://gorails.com/setup/ubuntu/16.04)
- Step 2: Use git clone app form: git clone git@github.com:dthtien/ss4nb.git
- Step 3: run cd ss4nb
- Step 4: run bundle
- Step 5: run rails db:create
  if you want to use demo database do step 6
  - Step 6:  psql -d sentimental_dss_development -f database.sql
- Step 7: run rails db:migrate
- Step : Enjoying