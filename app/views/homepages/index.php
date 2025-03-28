<?php require_once APPROOT . '/views/includes/header.php'; ?>

<!-- Voor het centreren van de container gebruiken we het boorstrap grid -->
<div class="container">
    <div class="row mt-3">

        <div class="col-2"></div>

        <div class="col-8">

            <h3><?php echo $data['title']; ?></h3>

            <div class="d-flex flex-column">
                <a href="<?= URLROOT; ?>/Magazijn/index">Overzicht Magazijn Jamin</a>
                <a href="<?= URLROOT; ?>/Leverancier/index">Overzicht Jamin Leveranciers</a> 
                <a href="<?= URLROOT; ?>/Leverancier/edit">Wijzigen Leveranciers</a> 
                <a href="<?= URLROOT; ?>/Allergeen/index">Overzicht Allergenen</a>
                <a href="<?= URLROOT; ?>/Product/index">Overzicht geleverde producten</a>
            </div>

        </div>
        
        <div class="col-2"></div>
        
    </div>

</div>

<?php require_once APPROOT . '/views/includes/footer.php'; ?>