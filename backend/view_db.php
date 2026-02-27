<?php

$dbFile = __DIR__ . '/employees.db';
$db = new PDO("sqlite:$dbFile");


$stmt = $db->query("SELECT * FROM employees");
$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee Database Viewer</title>
    <style>
        body { font-family: sans-serif; padding: 20px; background: #f4f7f6; }
        h2 { color: #333; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; background: white; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background: #6750A4; color: white; }
        tr:hover { background: #f1f1f1; }
        .active { color: green; font-weight: bold; }
        .inactive { color: red; }
        .flag { background-color: #e8f5e9; }
    </style>
</head>
<body>
    <h2>Employee Database Contents</h2>
    <p>File: <code><?php echo htmlspecialchars($dbFile); ?></code></p>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Join Date</th>
                <th>Status</th>
                <th>Flagged (5+ yrs & Active)</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($results as $row): 
                $joinDate = new DateTime($row['join_date']);
                $now = new DateTime();
                $years = $now->diff($joinDate)->y;
                $isFlagged = ($years >= 5 && $row['is_active']);
            ?>
            <tr class="<?php echo $isFlagged ? 'flag' : ''; ?>">
                <td><?php echo $row['id']; ?></td>
                <td><?php echo htmlspecialchars($row['name']); ?></td>
                <td><?php echo $row['join_date']; ?> (<?php echo $years; ?> yrs)</td>
                <td>
                    <span class="<?php echo $row['is_active'] ? 'active' : 'inactive'; ?>">
                        <?php echo $row['is_active'] ? 'Active' : 'Inactive'; ?>
                    </span>
                </td>
                <td><?php echo $isFlagged ? '✅ Yes' : 'No'; ?></td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</body>
</html>
