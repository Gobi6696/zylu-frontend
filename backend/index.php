<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$dbFile = 'employees.db';
$db = new PDO("sqlite:$dbFile");


$db->exec("CREATE TABLE IF NOT EXISTS employees (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    join_date DATE NOT NULL,
    is_active INTEGER DEFAULT 1
)");


$count = $db->query("SELECT COUNT(*) FROM employees")->fetchColumn();
if ($count == 0) {
    $employees = [
        ['John Doe', '2015-05-10', 1],
        ['Jane Smith', '2019-03-20', 1],
        ['Robert Brown', '2010-11-15', 1],
        ['Emma Wilson', '2021-08-01', 0],
        ['Michael Davis', '2017-12-10', 1],
        ['Sarah Miller', '2014-06-25', 0],
        ['David Clark', '2012-01-05', 1],
        ['Linda Garcia', '2023-05-12', 1],

    ];

    $stmt = $db->prepare("INSERT INTO employees (name, join_date, is_active) VALUES (?, ?, ?)");
    foreach ($employees as $emp) {
        $stmt->execute($emp);
    }
}


$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

if ($uri === '/api/employees') {
    $stmt = $db->query("SELECT * FROM employees");
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    

    echo json_encode($result);
} else {
    http_response_code(404);
    echo json_encode(["message" => "Endpoint not found"]);
}
?>
