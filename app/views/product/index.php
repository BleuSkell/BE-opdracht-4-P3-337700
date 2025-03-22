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
            <form action="<?= URLROOT; ?>/product/index" method="GET">
                <div class="form-group">
                    <label for="startDate">Start Datum:</label>
                    <input type="date" class="form-control" id="startDate" name="startDate" value="<?= isset($_GET['startDate']) ? $_GET['startDate'] : ''; ?>">
                </div>
                <div class="form-group">
                    <label for="endDate">Eind Datum:</label>
                    <input type="date" class="form-control" id="endDate" name="endDate" value="<?= isset($_GET['endDate']) ? $_GET['endDate'] : ''; ?>">
                </div>
                <button type="submit" class="btn btn-primary mt-2">Filter</button>
            </form>
        </div>
        <div class="col-2"></div>
    </div>

    <div class="row mt-3">
        <div class="col-2"></div>
        <div class="col-8">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Leverancier Naam</th>
                        <th>Contact Persoon</th>
                        <th>Product Naam</th>
                        <th>Totaal Geleverd</th>
                        <th>Specificatie</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if (!empty($data['dataRows'])) : ?>
                        <?php foreach ($data['dataRows'] as $row): ?>
                            <tr>
                                <td><?= $row->LeverancierNaam; ?></td>
                                <td><?= $row->LeverancierContactPersoon; ?></td>
                                <td><?= $row->ProductNaam; ?></td>
                                <td><?= $row->TotaalGeleverd; ?></td>
                                <td class='text-center'>
                                    <a href='<?= URLROOT . "/Product/specification/" ?>'>
                                        <i class="bi bi-question-lg"></i>
                                    </a>
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