<?php require_once APPROOT . '/views/includes/header.php'; ?>

<div class="container">
    <div class="row mt-3" style='<?= $data['messageVisibility']; ?>'>
            <div class="col-2"></div>
            <div class="col-8 text-center">
                <div class="alert alert-<?= $data['messageColor']; ?>" role="alert">
                    <?= $data['message']; ?>
                </div>
            </div>
            <div class="col-2"></div>
   </div>
</div>

<?php require_once APPROOT . '/views/includes/footer.php'; ?>