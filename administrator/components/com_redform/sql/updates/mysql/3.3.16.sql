SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `#__rwf_forms`
	ADD `params` text NOT NULL;

SET FOREIGN_KEY_CHECKS=1;
