<?php require_once APPROOT . '/views/includes/header.php'; ?>

<div class="container mt-5">

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
            <h3 class="text-decoration-underline"><?php echo $data['title']; ?></h3>
        </div>
        <div class="col-2"></div>
    </div>

    <div class="row mt-3">
        <div class="col-2"></div>
        <div class="col-8">
            <h5>Startdatum: <?= $data['startDate']; ?></h5>
            <h5>Einddatum: <?= $data['endDate']; ?></h5>
            <h5>Productnaam: <?= $data['dataRows'][0]->ProductNaam ?></h5>
            <h5>Allergenen: <?= implode(', ', array_unique(array_column($data['dataRows'], 'AllergeenNaam'))); ?></h5>
        </div>
        <div class="col-2"></div>
    </div>

    <div class="row mt-3">
        <div class="col-2"></div>
        <div class="col-8">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Datum levering</th>
                        <th>Aantal</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if (!empty($data['dataRows'])) : ?>
                        <?php foreach ($data['dataRows'] as $row): ?>
                            <tr>
                                <td><?= $row->DatumLevering; ?></td>
                                <td><?= $row->Aantal; ?></td>
                                </td>  
                            </tr>
                        <?php endforeach; ?>
                    <?php else : ?>
                        <tr>
                            <td colspan="5" class="text-center">Geen gegevens gevonden voor de opgegeven datumbereik.</td>
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
        <div class="col-2"></div>
    </div>

</div>

<?php require_once APPROOT . '/views/includes/footer.php'; ?>