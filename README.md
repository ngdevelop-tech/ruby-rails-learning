# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Steps to create a form - Registration Form

1. Create model
    ```
    rails generate model User email:string password:digest
    ```
    - `password:digest` is required when you want to save user password

2. Rails DB migrate

    ```
    rails db:migrate
    ```

3. Add bcrypt for managing passwords (only required when you have table with `has_secure_password`)

    - Uncomment `bcrypt` gem in `Gemfile`
    - execute `bundle` for installing the same.

4. Test connection

    By executing rails console with `rails c`.

    ```
    > User

    > User.all

    > User.create({email: 'test@test.com', password: "password", password_confirmation: "password"})
    ```

5. create a registration controller with `new` and `create` def
6. create `reginstration/new.html.erb` html