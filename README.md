# PHP + MySQL Registration Demo ✅

This small demo shows a simple and secure registration flow using PHP, MySQL (PDO), HTML and CSS.

## Files
- `sql/schema.sql` - Create database and `users` table
- `inc/config.php` - PDO connection (update credentials)
- `public/register.php` - Registration form
- `public/process_register.php` - Server-side validation & insertion
- `public/success.php` - Post-registration page
- `css/styles.css` - Basic styling

## Setup
1. Import the SQL schema (e.g., via phpMyAdmin or mysql CLI):
   - `mysql -u root -p < sql/schema.sql`
2. Update DB credentials in `inc/config.php`.
3. Serve the `public` directory with PHP (e.g., using XAMPP/WAMP or PHP built-in server):
   - `php -S localhost:8000 -t public`
4. Open `http://localhost:8000/register.php` in your browser.

## Notes & Security
- Passwords are hashed with `password_hash`.
- All DB operations use prepared statements (PDO) to avoid SQL injection.
- Basic CSRF protection is included via a session token.

Consider adding:
- Email verification
- Rate limiting and CAPTCHA
- Login flow and sessions
- Stronger password rules

If you'd like, I can add login, email verification, or email sending next. :)