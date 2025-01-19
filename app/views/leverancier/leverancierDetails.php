<?php require_once APPROOT . '/views/includes/header.php'; ?>

<div class="container">

    <div class="row mt-3 text-center" style="display:<?= $data['messageVisibility']; ?>">
        <div class="col-2"></div>
        <div class="col-8">
            <div class="alert alert-<?= $data['messageColor']; ?>" role="alert">
                <?= $data['message']; ?>
            </div>
        </div>
        <div class="col-2"></div>
    </div>

    <div class="row mt-3">
        <div class="col-2"></div>
        <div class="col-8">
            <h2><?php echo $data['title']; ?></h2>
        </div>
        <div class="col-2"></div>
    </div>

    <div class="row mt-3">
        <div class="col-2"></div>
        <div class="col-8">
            
            <div class="container d-flex flex-column border border-3 border-black">
                <div class="d-flex flex-row justify-content-between">
                    <h5>Naam</h5>
                    <h5><?= $data['dataRows']->Naam; ?></h5>
                </div>
                
                <div class="d-flex flex-row justify-content-between">
                    <h5>Contact persoon</h5>
                    <h5><?= $data['dataRows']->ContactPersoon; ?></h5>
                </div>

                <div class="d-flex flex-row justify-content-between">
                    <h5>Leverancier nummer</h5>
                    <h5><?= $data['dataRows']->LeverancierNummer; ?></h5>
                </div>

                <div class="d-flex flex-row justify-content-between">
                    <h5>Mobiel</h5>
                    <h5><?= $data['dataRows']->Mobiel; ?></h5>
                </div>

                <div class="d-flex flex-row justify-content-between">
                    <h5>Straatnaam</h5>
                    <h5><?= $data['dataRows']->Straatnaam; ?></h5>
                </div>

                <div class="d-flex flex-row justify-content-between">
                    <h5>Huisnummer</h5>
                    <h5><?= $data['dataRows']->Huisnummer; ?></h5>
                </div>

                <div class="d-flex flex-row justify-content-between">
                    <h5>Postcode</h5>
                    <h5><?= $data['dataRows']->Postcode; ?></h5>
                </div>

                <div class="d-flex flex-row justify-content-between">
                    <h5>Stad</h5>
                    <h5><?= $data['dataRows']->Stad; ?></h5>
                </div>
            </div>

            <a href='<?= URLROOT . "/Leverancier/editLeverancier/" . $data['dataRows']->LeverancierId ?>'><button>Wijzig</button></a>

            <a href="<?= URLROOT; ?>/homepages/index">Homepage</a> |
            <a href="<?= URLROOT; ?>/leverancier/edit">Leverancier Overzicht</a>
        </div>
        <div class="col-2"></div>
    </div>

</div>

<?php require_once APPROOT . '/views/includes/footer.php'; ?>