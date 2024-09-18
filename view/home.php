<!DOCTYPE html>
<html lang="en">
	<head>
		<?php
		require 'view/common/head.php';
		?>
		
	</head>
	<body>

		<div class="container-fluid">
			<?php
			require 'view/common/nav.php';
			?>
			<div class="row">
				<?php
				require 'view/common/categories.php';
				?>
				<div class="col-md-10">

				<?php
// Database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bazaar";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch categories from the database
$sql = "SELECT * FROM category";
$result = $conn->query($sql);

if ($result === false) {
    // Output the error message
    echo "Error: " . $conn->error;
} else {
    if ($result->num_rows > 0) {
        // Loop through the categories and generate the HTML
        while($row = $result->fetch_assoc()) {
            echo '<div class="col-md-3 col-sm-6">';
            echo '    <div class="thumbnail">';
            echo '        <img alt="Bootstrap Thumbnail First" src="assets/' . $row["label"] . '.svg" style="width: 100%; height: 220px">';
            echo '        <div class="caption">';
            echo '            <h3>' . $row["label"] . '</h3>';
            echo '            <p>';
            echo '                <a class="btn btn-primary" style="width: 100%;" href="products.php?op=list&cat=' . $row["id"] . '">Go!</a>';
            echo '            </p>';
            echo '        </div>';
            echo '    </div>';
            echo '</div>';
        }
    } else {
        echo "No categories found.";
    }
}

$conn->close();
?>

				</div>
			</div>
			<?php
			require 'view/common/footer.php';
			?>
		</div>

	</body>
</html>