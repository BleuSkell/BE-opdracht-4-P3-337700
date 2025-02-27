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
            
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Naam Leverancier</th>
                        <th>Contactpersoon</th>
                        <th>Mobiel</th>
                        <th>Stad</th>
                        <th>Straat</th>
                        <th>Huisnummer</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if (is_null($data['dataRows'])) { ?>
                              <tr>
                                <td colspan='6' class='text-center'>Door een storing kunnen we op dit moment geen producten tonen uit het magazijn</td>
                              </tr>
                    <?php } else { ?>
                                <tr>
                                    <td><?= $data['dataRows']->Naam ?></td>
                                    <td><?= $data['dataRows']->ContactPersoon ?></td>
                                    <td><?= $data['dataRows']->Mobiel ?></td>
                                    <td><?= $data['dataRows']->Stad ?></td>
                                    <td><?= $data['dataRows']->Straatnaam ?></td>
                                    <td><?= $data['dataRows']->Huisnummer ?></td>
                                </tr>
                    <?php } ?>
                </tbody>
            </table>
            <a href="<?= URLROOT; ?>/homepages/index">Homepage</a>
        </div>
        <div class="col-2"></div>
    </div>

</div>

<?php require_once APPROOT . '/views/includes/footer.php'; ?>