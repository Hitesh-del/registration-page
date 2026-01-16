# Step-by-Step Setup Guide for Registration Form

## Prerequisites
You need PHP and MySQL installed on your Windows machine. The easiest way is to use **XAMPP** or **WAMP**.

---

## Step 1: Install XAMPP (if not already installed)

1. Download XAMPP from: https://www.apachefriends.org/
2. Install XAMPP (choose default location: `C:\xampp`)
3. During installation, make sure to select:
   - Apache
   - MySQL
   - PHP
   - phpMyAdmin

---

## Step 2: Start Apache and MySQL Services

1. Open **XAMPP Control Panel**
2. Click **Start** button next to **Apache**
3. Click **Start** button next to **MySQL**
4. Both should show green "Running" status

---

## Step 3: Create the Database

### Option A: Using phpMyAdmin (Easier)
1. Open your browser and go to: `http://localhost/phpmyadmin`
2. Click on **SQL** tab at the top
3. Copy and paste the contents of `sql/schema.sql`:
   ```sql
   CREATE DATABASE IF NOT EXISTS registration_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   USE registration_db;
   
   CREATE TABLE IF NOT EXISTS users (
     id INT AUTO_INCREMENT PRIMARY KEY,
     username VARCHAR(50) NOT NULL UNIQUE,
     email VARCHAR(255) NOT NULL UNIQUE,
     password_hash VARCHAR(255) NOT NULL,
     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
   ```
4. Click **Go** button
5. You should see "Database created successfully"

### Option B: Using Command Line
1. Open Command Prompt or PowerShell
2. Navigate to MySQL bin directory:
   ```powershell
   cd C:\xampp\mysql\bin
   ```
3. Run MySQL:
   ```powershell
   mysql.exe -u root
   ```
4. Copy and paste the SQL from `sql/schema.sql`
5. Type `exit` to quit MySQL

---

## Step 4: Configure Database Connection

1. Open `inc/config.php` in a text editor
2. Update the database credentials if needed (default XAMPP settings usually work):
   ```php
   $db_host = 'localhost';
   $db_name = 'registration_db';
   $db_user = 'root';
   $db_pass = '';  // Leave empty for default XAMPP
   ```

---

## Step 5: Copy Project Files to XAMPP

1. Copy the entire `registration` folder to: `C:\xampp\htdocs\`
2. Your project should now be at: `C:\xampp\htdocs\registration\`

**OR** if you want to keep it in your current location, you can use PHP's built-in server (see Alternative Method below).

---

## Step 6: Access the Registration Form

1. Open your web browser
2. Navigate to: `http://localhost/registration/public/register.php`
3. You should see the registration form!

---

## Alternative Method: Using PHP Built-in Server (No XAMPP needed)

If you have PHP installed separately and want to run from your current location:

1. Open PowerShell or Command Prompt
2. Navigate to your project's `public` folder:
   ```powershell
   cd C:\Users\Hitesh\Downloads\practice\practice\registration\public
   ```
3. Start PHP server:
   ```powershell
   php -S localhost:8000
   ```
4. Open browser and go to: `http://localhost:8000/register.php`

**Note:** You still need MySQL running for this method. You can use XAMPP MySQL only, or install MySQL separately.

---

## Troubleshooting

### Database Connection Error
- Make sure MySQL is running in XAMPP Control Panel
- Check that database `registration_db` exists (verify in phpMyAdmin)
- Verify credentials in `inc/config.php`

### Page Not Found (404)
- Check the URL path is correct
- Make sure files are in the right location
- Verify Apache is running

### PHP Errors
- Make sure PHP is enabled in Apache
- Check PHP version (should be 7.0+)
- Look at Apache error logs: `C:\xampp\apache\logs\error.log`

### CSS Not Loading
- Check browser console (F12) for 404 errors
- Verify the CSS file path in `register.php` is correct relative to the PHP file

---

## Testing the Form

1. Fill out the registration form:
   - Username: (any username, max 50 characters)
   - Email: (valid email address)
   - Password: (at least 8 characters)
   - Confirm Password: (must match password)

2. Click **Register**
3. If successful, you'll be redirected to `success.php`
4. Check the database in phpMyAdmin to see your registered user

---

## Quick Start Checklist

- [ ] XAMPP installed
- [ ] Apache started
- [ ] MySQL started
- [ ] Database created (`registration_db`)
- [ ] Files copied to `htdocs` or using PHP built-in server
- [ ] Database credentials configured
- [ ] Browser opened to registration page

---

## Need Help?

If you encounter issues:
1. Check XAMPP Control Panel for error messages
2. Check browser console (F12) for JavaScript/CSS errors
3. Check Apache error logs
4. Verify all file paths are correct
