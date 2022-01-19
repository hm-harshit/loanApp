<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400"></a></p>


# Loan App

For this Mini-Aspire Loan App I using PHP7.4, MySQL, Laravel 6

## Postman Collection
https://www.getpostman.com/collections/b7c9a3766e1c0c3258bf

## Install Instructions 

- git clone https://github.com/hm-harshit/loanApp.git; cd loanApp;
- composer update
- Enter the Mysql database details in .env file
- php artisan migrate or import the db.sql file
- php artisan passport:install
- php artisan serve

## Database Stractures
For user authentication I am usign Laravel Passport.

There are Two type of users (user Table has "type" field)
- Normal User (which has the type is 0)
- Admin User (which has the type is 1)

Normal User can create Loan Request which is approved by
admin user (In the loans tabel there is field is_approved) with intrest rate.

In the Loans Table there are 4 types of status 
- 0 = Pending (When the Loan is pending)
- 1 = Paid (When the admin has paid the loan amount)
- 2 = Completed (When the user has repaid all the EMI's)
- 3 = UnPaid (When the user hasn’t repaid the loan amount and time period has gone)



![screenshot](screenshot.png)
