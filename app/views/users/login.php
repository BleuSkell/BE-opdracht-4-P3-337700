<?php require_once APPROOT . '/views/includes/header.php'; ?>

<main>
    <form action="<?=URLROOT;?>/users/login" method="post">
        <label for="email">Fill in your email</label>
        <input type="email" name="email" id="email" placeholder="John@example.com">

        <label for="password">Fill in your password</label>
        <input type="password" name="password" id="password">

        <button type="submit">Login</button>
        <a href="<?=URLROOT;?>/users/register">If you don't have an account, make one here</a>
    </form>
</main>

<?php require_once APPROOT . '/views/includes/footer.php'; ?>