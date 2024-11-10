<?php require_once APPROOT . '/views/includes/header.php'; ?>

<main>
    <form action="<?=URLROOT;?>/users/register" method="post">
        <input type="email" name="emailInput" id="emailInput" placeholder="John@example.com" required>
        <input type="text" name="firstName" id="firstName" placeholder="John" required>
        <input type="text" name="infix" id="infix" placeholder="van">
        <input type="text" name="lastName" id="lastName" placeholder="Doe" required>

        <label for="passwordInput">Make a password</label>
        <input type="password" name="passwordInput" id="passwordInput" required>

        <label for="passwordConfirm">Confirm your password</label>
        <input type="password" name="passwordConfirm" id="passwordConfirm" required>

        <button type="submit">Register</button>
    </form>
</main>

<?php require_once APPROOT . '/views/includes/footer.php'; ?>