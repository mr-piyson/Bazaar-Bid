<?php

/**
 *
 */
require_once 'config.php';
class categoryModel {

	function __construct() {
		$this -> conset = new config();
	}

	public function openDB() {
		$this -> conn = new mysqli($this -> conset -> servername, $this -> conset -> username, $this -> conset -> password, $this -> conset -> dbname);
		if ($this -> conn -> connect_error) {
			die("Connection failed: " . $this -> conn -> connect_error);
		}
	}

	public function closeDB() {
		$this -> conn -> close();
	}

	public function getCategory() {
		$this -> openDB();
		$stmt = $this -> conn -> prepare("SELECT id, label, link, parent FROM category");
		$category = array('items' => array(), 'parents' => array());
		$stmt -> execute();
		$res = $stmt -> get_result();
		while ($items = $res -> fetch_assoc()) {
			$category['items'][$items['id']] = $items;
			$category['parents'][$items['parent']][] = $items['id'];
		}
		$stmt -> close();
		$this -> closeDB();
		return $category;
	}

}
?>