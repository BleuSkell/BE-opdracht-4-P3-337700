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
            <div class="d-flex row align-items-center">
                <h4 class="col-5 m-0 p-0 h-25 text-center text-decoration-underline"><?php echo $data['title']; ?></h4>
                
                <form action="<?= URLROOT; ?>/Product/index" method="GET" class="col-7 p-0">
                    <div class="d-flex row justify-content-evenly">
                        <div class="form-group col-4 d-flex row">
                            <label for="startDate">Start Datum:</label>
                            <input type="date" class="form-control" id="startDate" name="startDate" value="<?= $data['startDate'] ?>">
                        </div>
                        <div class="form-group col-4 d-flex row">
                            <label for="endDate">Eind Datum:</label>
                            <input type="date" class="form-control" id="endDate" name="endDate" value="<?= $data['endDate'] ?>">
                        </div>
                        <button type="submit" class="btn btn-primary mt-4 col-3">Maak selectie</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-2"></div>
    </div>

    <div class="row mt-3">
        <div class="col-2"></div>
        <div class="col-8">
            <table class="table table-bordered">
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
                                    <a href='<?= URLROOT . "/Product/details/" . $row->ProductPerLeverancierId . "?startDate=" . $data['startDate'] . "&endDate=" . $data['endDate'] ?>'>
                                        <i class="bi bi-question-lg"></i>
                                    </a>
                                </td>  
                            </tr>
                        <?php endforeach; ?>
                    <?php else : ?>
                        <tr>
                            <td colspan="5" class="text-center">Er zijn geen leveringen geweest van producten in deze periode.</td>
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>

            <a href="<?= URLROOT; ?>/homepages/index">Homepage</a>
        
        </div>
        <div class="col-2"></div>
    </div>

</div>

<?php require_once APPROOT . '/views/includes/footer.php'; ?>