<?php require_once APPROOT . '/views/includes/header.php'; ?>

<?php if (!isset($_SESSION['ID'])): ?>
    <h3>You're not logged in yet</h3>
    <p>Login <a href="<?=URLROOT;?>/users/register">here</a></p>
<?php else : ?>
    <h1><?=$data['title']?></h1>
    <h3>Hello from the users index</h3>
<?php endif; ?>

<?php require_once APPROOT . '/views/includes/footer.php'; ?>