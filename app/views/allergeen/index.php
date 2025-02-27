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
            <h3><?php echo $data['title']; ?></h3>
        </div>
        <div class="col-2"></div>
    </div>

    <div class="row mt-3">
        <div class="col-2"></div>
        <div class="col-8">
            
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Naam Product</th>
                        <th>Naam Allergeen</th>
                        <th>Omschrijving</th>
                        <th>Aantal Aanwezig</th>
                        <th>Info</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if (is_null($data['dataRows'])) { ?>
                              <tr>
                                <td colspan='6' class='text-center'>Door een storing kunnen we op dit moment geen producten tonen uit het magazijn</td>
                              </tr>
                    <?php } else {                              
                              foreach ($data['dataRows'] as $allergeenProduct) { ?>
                                <tr>
                                    <td><?= $allergeenProduct->ProductNaam ?></td>
                                    <td><?= $allergeenProduct->AllergeenNaam ?></td>
                                    <td><?= $allergeenProduct->AllergeenOmschrijving ?></td>
                                    <td><?= $allergeenProduct->MagazijnAantalAanwezig ?></td>
                                    <td class='text-center'>
                                        <a href='<?= URLROOT . "/" ?>'>
                                            <i class="bi bi-question-lg"></i>
                                        </a>
                                    </td>  
                                </tr>
                    <?php } } ?>
                </tbody>
            </table>
            <a href="<?= URLROOT; ?>/homepages/index">Homepage</a>
        </div>
        <div class="col-2"></div>
    </div>

</div>

<?php require_once APPROOT . '/views/includes/footer.php'; ?>