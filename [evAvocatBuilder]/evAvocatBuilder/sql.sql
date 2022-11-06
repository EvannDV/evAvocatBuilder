INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_avocat', 'avocat', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_avocat', 'avocat', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_avocat', 'avocat', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('avocat', 'avocat')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('avocat',0,'recrue','En formation',12,'{}','{}'),
	('avocat',1,'medium',"Formateur",24,'{}','{}'),
	('avocat',2,'co','Haut Grade',36,'{}','{}'),
	('avocat',3,'boss',"Dirigeant",48,'{}','{}')
;

INSERT INTO `items` (`name`, `label`, `rare`, `can_remove`) VALUES
('tenueavocat', 'tenue Avocat', 0, 1),



