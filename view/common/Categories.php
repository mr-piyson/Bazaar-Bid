<div class="col-md-2">
	<div class="list-group">
		<a class="list-group-item"><h1>Category</h1></a>

		<!-- <a href="products.php?op=list&cat=3" class='list-group-item'>Cars
		<span class='badge'>3</span></a> -->
 <?php

		function buildcategory($parent) {

			$html = "";
			$conn = new mysqli("localhost", "root", "", "bazaar");
			$stmt = $conn->prepare("SELECT id, label, link, parent FROM category");
			$stmt->execute();
			$result = $stmt->get_result();

			$category = array(
				'items' => array(),
				'parents' => array()
			);

			while ($row = $result->fetch_assoc()) {
				$category['items'][$row['id']] = $row;
				$category['parents'][$row['parent']][] = $row['id'];
			}

			$stmt->close();
			$conn->close();
			
			foreach ($category['parents'][$parent] as $itemId) {
				if (!isset($category['parents'][$itemId])) {
					$html .= "<a href='products.php?op=list&cat=" . $category['items'][$itemId]['id'] . "' class='list-group-item'>" . $category['items'][$itemId]['label'] . "</a>";
				}
				if (isset($category['parents'][$itemId])) {
					$html .= "
             <a href='products.php?op=list&cat=" . $category['items'][$itemId]['id'] . "' class='list-group-item'>" . $category['items'][$itemId]['label'] . "</a>";
					$html .= buildcategory($itemId, $category);

				}
			}

			return $html;
		}

		echo buildcategory(0);
		// ?>
		

		<?php

		/*
		 // category builder function, parentId 0 is the root
		 function buildcategory($parent, $category) {
		 $html = "";
		 if (isset($category['parents'][$parent])) {
		 $html .= "
		 <ul>\n";
		 foreach ($category['parents'][$parent] as $itemId) {
		 if (!isset($category['parents'][$itemId])) {
		 $html .= "<li>\n  <a href='" . $category['items'][$itemId]['link'] . "'>" . $category['items'][$itemId]['label'] . "</a>\n</li> \n";
		 }
		 if (isset($category['parents'][$itemId])) {
		 $html .= "
		 <li>\n  <a href='" . $category['items'][$itemId]['link'] . "'>" . $category['items'][$itemId]['label'] . "</a> \n";
		 $html .= buildcategory($itemId, $category);
		 $html .= "</li> \n";
		 }
		 }
		 $html .= "</ul> \n";
		 }
		 return $html;
		 }

		 echo buildcategory(0, $category);

		 *
		 */
		//?> 
	</div>
</div>