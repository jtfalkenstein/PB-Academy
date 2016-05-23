DROP TABLE IF EXISTS `#__CBULessons`;
DROP TABLE IF EXISTS `#__CBUContentTypes`;
DROP TABLE IF EXISTS `#__CBUCategories`;
DROP TABLE IF EXISTS `#__CBUSeries`;

CREATE TABLE `#__CBUContentTypes` (
    `Id`        INT(11)     NOT NULL AUTO_INCREMENT,
    `TypeName`  VARCHAR(25) NOT NULL,
    PRIMARY KEY (`Id`)
)
    ENGINE =InnoDB
    AUTO_INCREMENT =0
    DEFAULT CHARSET =utf8;


CREATE TABLE `#__CBUCategories` (
    `Id`            INT(11)         NOT NULL AUTO_INCREMENT,
    `Name`          VARCHAR(100)    NOT NULL,
    `Description`   TEXT            NULL,
    `ImagePath`     VARCHAR(255)    NULL,
    PRIMARY KEY (`Id`)
)
    ENGINE =InnoDB
    AUTO_INCREMENT =0
    DEFAULT CHARSET =utf8;

CREATE TABLE `#__CBUSeries` (
    `Id`            INT(11)     NOT NULL AUTO_INCREMENT,
    `SeriesName`    VARCHAR(255) NOT NULL,
    `ImagePath`     VARCHAR(255) NULL,
    `Description`   VARCHAR(255) NULL,
    PRIMARY KEY (`Id`)
)
    ENGINE =InnoDB
    AUTO_INCREMENT =0
    DEFAULT CHARSET =utf8;


CREATE TABLE `#__CBULessons` (
    `Id`            INT(11)         NOT NULL AUTO_INCREMENT,
    `Title`         VARCHAR(255)    NOT NULL,
    `SeriesId`      INT(11)         NULL, /*This will become a foreign key when that part of the site gets built out*/
    `CategoryId`    INT(11)         NOT NULL,
    `ContentTypeId` INT(11)         NOT NULL,
    `ImagePath`     VARCHAR(255)    NULL,
    `SourceCredit`  VARCHAR(255)    NULL,
    `Content`       TEXT            NULL,
    `Description`   TEXT            NULL,
    `DatePublished` DATE            NULL,
    `SeriesOrder`   TINYINT(4)      NULL,
    PRIMARY KEY (`Id`),
    FOREIGN KEY (`ContentTypeId`)
        REFERENCES `#__CBUContentTypes`(`Id`)
        ON DELETE CASCADE,
    FOREIGN KEY (`CategoryId`)
        REFERENCES `#__CBUCategories` (`Id`)
        ON DELETE CASCADE,
    FOREIGN KEY (`SeriesId`)
        REFERENCES `#__CBUSeries` (`Id`)
        ON DELETE SET NULL
)
    Engine =InnoDB
    AUTO_INCREMENT =0
    DEFAULT CHARSET =utf8;

INSERT INTO `#__CBUContentTypes` (`Id`,`TypeName`) VALUES
(1, 'Brainshark'),
(2, 'Generic Video'),
(3, 'Download'),
(4, 'YouTube'),
(5, 'Html'),
(6, 'Nazarene Media Library');


INSERT INTO `#__CBUCategories` (`Id`, `Name`, `Description`, `ImagePath`) VALUES
(1, 'The Treasurer''s Corner', 'Here you''ll find lessons related to the role of treasurer', 'http://placekitten.com/600/500'),
(2, 'Taking care of your pastor', 'Here you''ll find lessons about how to pay and otherwise care of your pastor.', 'http://placekitten.com/600/450'),
(3, 'The Secretary''s Corner', 'This is all about secretary stuff.', 'http://placekitten.com/600/450'),
(4, 'What does the Manual say?', 'This is all about issues relating to the Manual.', '/components/com_pbacademy/images/categories/manual.jpg'),
(5, 'Frequently Asked Questions', 'This is the place for all your frequently asked questions.', '/components/com_pbacademy/images/categories/FAQs.jpg'),
(6, 'Church Board Members', 'This is the place for all the questions you might have relateing to the role of church board member.','/components/com_pbacademy/images/categories/ChurchBoardTable.jpg'),
(7, 'The Pastor''s role','Here we''ll address how a pastor can fulfill his function as ex officio president and chairperson of the board.','http://lorempixel.com/600/500'),
(8, 'Legal and Tax Issues','This is the place for lessons related to legal and tax issues.', '/components/com_pbacademy/images/categories/legal.jpg');

INSERT INTO `#__CBUSeries` (`Id`,`SeriesName`, `ImagePath`, `Description`) VALUES
(1, 'This is my first test series.','http://lorempixel.com/600/337','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus maximus ante ut condimentum iaculis. In quam ante, auctor id quam quis, tempus tristique dui. Ut ut elit eget dui ultricies malesuada. Nam mi est, venenatis porta tincidunt quis, tempor quis ex. Nam finibus metus eu purus luctus consequat. Vestibulum vestibulum.'),
(2, 'This is my second test series.','http://lorempixel.com/600/337','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus maximus ante ut condimentum iaculis. In quam ante, auctor id quam quis, tempus tristique dui. Ut ut elit eget dui ultricies malesuada. Nam mi est, venenatis porta tincidunt quis, tempor quis ex. Nam finibus metus eu purus luctus consequat. Vestibulum vestibulum.');


INSERT INTO `#__CBULessons` (`Id`, `Title`, `SeriesId`, `CategoryId`, `ContentTypeId`, `ImagePath`, `SourceCredit`, `Content`, `Description`, `DatePublished`) VALUES
(1, 'My First lesson', 1, 8, 3, 'http://placekitten.com/600/337', NULL, '/resources/board_of_pensions/bop_agenda_201402.pdf', 'My description', '2016-04-07'),
(2, 'My second lesson', NULL, 5, 6, '/components/com_pbacademy/images/lessons/CharitableReceipting.png', 'Stewardship Ministries', 'http://medialibrary.nazarene.org/media/webinar-charitable-receipting', 'This is my second lesson', '2016-04-06'),
(3, 'My third lesson', 2, 4, 4, '/components/com_pbacademy/images/lessons/2016AnnualReport.png', NULL, 'https://www.youtube.com/watch?v=z_ZuDHD2FHo', 'This is my third one', '2016-04-07'),
(4, 'Lesson #4!', 1, 2, 1, '/components/com_pbacademy/images/lessons/PastoralComp.png', NULL, 'https://www.brainshark.com/pbusa/Structuring-Pastoral-Comp', 'This is my Fourth lesson', '2016-04-07');

INSERT INTO `#__CBULessons` (`Title`, `SeriesId`, `CategoryId`, `ContentTypeId`, `ImagePath`, `SourceCredit`, `Content`, `Description`, `DatePublished`, `SeriesOrder`) VALUES
('Lesson A!', 1, 1, 1, '/components/com_pbacademy/images/lessons/PastoralComp.png', 'Ron Bell''s vast wisdom and knowledge', 'https://www.brainshark.com/pbusa/Structuring-Pastoral-Comp', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae accumsan felis. Vestibulum vulputate sem id diam sagittis, sed varius nisl placerat. Curabitur pellentesque dolor varius, vehicula dui a, dapibus dui. Aliquam congue sapien ac sapien vulputate bibendum. Aenean tempor volutpat elit quis tristique. Fusce eu mattis ante, nec fringilla elit. Aliquam magna libero, molestie vel luctus eu, molestie eu erat. Pellentesque bibendum, augue id vestibulum dapibus, libero urna ultrices urna, eu malesuada sem nunc et felis. Fusce bibendum tortor non tortor tempor ullamcorper. Sed venenatis at nibh et pulvinar. Etiam nisl nisl, hendrerit et est vitae, hendrerit porttitor est.', '2016-04-07',1),
('Lesson B?', 2, 2, 1, 'http://placekitten.com/600/337', 'A sloth hanging from a tree', 'https://www.brainshark.com/pbusa/Structuring-Pastoral-Comp', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae accumsan felis. Vestibulum vulputate sem id diam sagittis, sed varius nisl placerat. Curabitur pellentesque dolor varius, vehicula dui a, dapibus dui. Aliquam congue sapien ac sapien vulputate bibendum. Aenean tempor volutpat elit quis tristique. Fusce eu mattis ante, nec fringilla elit. Aliquam magna libero, molestie vel luctus eu, molestie eu erat. Pellentesque bibendum, augue id vestibulum dapibus, libero urna ultrices urna, eu malesuada sem nunc et felis. Fusce bibendum tortor non tortor tempor ullamcorper. Sed venenatis at nibh et pulvinar. Etiam nisl nisl, hendrerit et est vitae, hendrerit porttitor est.', '2016-04-06',1),
('Lesson C.', 1, 3, 1, 'http://lorempixel.com/600/337', '<a href="http://nazarene.org">Nazarene.org</a>"', 'https://www.brainshark.com/pbusa/Structuring-Pastoral-Comp', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae accumsan felis. Vestibulum vulputate sem id diam sagittis, sed varius nisl placerat. Curabitur pellentesque dolor varius, vehicula dui a, dapibus dui. Aliquam congue sapien ac sapien vulputate bibendum. Aenean tempor volutpat elit quis tristique. Fusce eu mattis ante, nec fringilla elit. Aliquam magna libero, molestie vel luctus eu, molestie eu erat. Pellentesque bibendum, augue id vestibulum dapibus, libero urna ultrices urna, eu malesuada sem nunc et felis. Fusce bibendum tortor non tortor tempor ullamcorper. Sed venenatis at nibh et pulvinar. Etiam nisl nisl, hendrerit et est vitae, hendrerit porttitor est.', '2016-04-05',1),
('Lesson D.', null, 1, 1, '/components/com_pbacademy/images/lessons/PastoralComp.png', NULL, 'https://www.brainshark.com/pbusa/Structuring-Pastoral-Comp', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae accumsan felis. Vestibulum vulputate sem id diam sagittis, sed varius nisl placerat. Curabitur pellentesque dolor varius, vehicula dui a, dapibus dui. Aliquam congue sapien ac sapien vulputate bibendum. Aenean tempor volutpat elit quis tristique. Fusce eu mattis ante, nec fringilla elit. Aliquam magna libero, molestie vel luctus eu, molestie eu erat. Pellentesque bibendum, augue id vestibulum dapibus, libero urna ultrices urna, eu malesuada sem nunc et felis. Fusce bibendum tortor non tortor tempor ullamcorper. Sed venenatis at nibh et pulvinar. Etiam nisl nisl, hendrerit et est vitae, hendrerit porttitor est.', '2016-04-07',null),
('Lesson E!', null, 2, 1, 'http://lorempixel.com/600/337', NULL, 'https://www.brainshark.com/pbusa/Structuring-Pastoral-Comp', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae accumsan felis. Vestibulum vulputate sem id diam sagittis, sed varius nisl placerat. Curabitur pellentesque dolor varius, vehicula dui a, dapibus dui. Aliquam congue sapien ac sapien vulputate bibendum. Aenean tempor volutpat elit quis tristique. Fusce eu mattis ante, nec fringilla elit. Aliquam magna libero, molestie vel luctus eu, molestie eu erat. Pellentesque bibendum, augue id vestibulum dapibus, libero urna ultrices urna, eu malesuada sem nunc et felis. Fusce bibendum tortor non tortor tempor ullamcorper. Sed venenatis at nibh et pulvinar. Etiam nisl nisl, hendrerit et est vitae, hendrerit porttitor est.', '2016-04-07',null),
('Lesson A!', 1, 1, 1, '/components/com_pbacademy/images/lessons/PastoralComp.png', 'Ron Bell''s vast wisdom and knowledge', 'https://www.brainshark.com/pbusa/Structuring-Pastoral-Comp', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae accumsan felis. Vestibulum vulputate sem id diam sagittis, sed varius nisl placerat. Curabitur pellentesque dolor varius, vehicula dui a, dapibus dui. Aliquam congue sapien ac sapien vulputate bibendum. Aenean tempor volutpat elit quis tristique. Fusce eu mattis ante, nec fringilla elit. Aliquam magna libero, molestie vel luctus eu, molestie eu erat. Pellentesque bibendum, augue id vestibulum dapibus, libero urna ultrices urna, eu malesuada sem nunc et felis. Fusce bibendum tortor non tortor tempor ullamcorper. Sed venenatis at nibh et pulvinar. Etiam nisl nisl, hendrerit et est vitae, hendrerit porttitor est.', '2016-04-04',2),
('Lesson B?', 2, 2, 1, 'http://placekitten.com/600/337', 'A sloth hanging from a tree', 'https://www.brainshark.com/pbusa/Structuring-Pastoral-Comp', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae accumsan felis. Vestibulum vulputate sem id diam sagittis, sed varius nisl placerat. Curabitur pellentesque dolor varius, vehicula dui a, dapibus dui. Aliquam congue sapien ac sapien vulputate bibendum. Aenean tempor volutpat elit quis tristique. Fusce eu mattis ante, nec fringilla elit. Aliquam magna libero, molestie vel luctus eu, molestie eu erat. Pellentesque bibendum, augue id vestibulum dapibus, libero urna ultrices urna, eu malesuada sem nunc et felis. Fusce bibendum tortor non tortor tempor ullamcorper. Sed venenatis at nibh et pulvinar. Etiam nisl nisl, hendrerit et est vitae, hendrerit porttitor est.', '2016-04-03',2),
('Lesson C.', 1, 3, 1, 'http://lorempixel.com/600/337', '<a href="http://nazarene.org">Nazarene.org</a>"', 'https://www.brainshark.com/pbusa/Structuring-Pastoral-Comp', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae accumsan felis. Vestibulum vulputate sem id diam sagittis, sed varius nisl placerat. Curabitur pellentesque dolor varius, vehicula dui a, dapibus dui. Aliquam congue sapien ac sapien vulputate bibendum. Aenean tempor volutpat elit quis tristique. Fusce eu mattis ante, nec fringilla elit. Aliquam magna libero, molestie vel luctus eu, molestie eu erat. Pellentesque bibendum, augue id vestibulum dapibus, libero urna ultrices urna, eu malesuada sem nunc et felis. Fusce bibendum tortor non tortor tempor ullamcorper. Sed venenatis at nibh et pulvinar. Etiam nisl nisl, hendrerit et est vitae, hendrerit porttitor est.', '2016-04-02',2),
('Lesson D.', null, 1, 1, '/components/com_pbacademy/images/lessons/PastoralComp.png', NULL, 'https://www.brainshark.com/pbusa/Structuring-Pastoral-Comp', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae accumsan felis. Vestibulum vulputate sem id diam sagittis, sed varius nisl placerat. Curabitur pellentesque dolor varius, vehicula dui a, dapibus dui. Aliquam congue sapien ac sapien vulputate bibendum. Aenean tempor volutpat elit quis tristique. Fusce eu mattis ante, nec fringilla elit. Aliquam magna libero, molestie vel luctus eu, molestie eu erat. Pellentesque bibendum, augue id vestibulum dapibus, libero urna ultrices urna, eu malesuada sem nunc et felis. Fusce bibendum tortor non tortor tempor ullamcorper. Sed venenatis at nibh et pulvinar. Etiam nisl nisl, hendrerit et est vitae, hendrerit porttitor est.', '2016-04-07',null),
('Lesson E!', null, 2, 1, 'http://lorempixel.com/600/337', NULL, 'https://www.brainshark.com/pbusa/Structuring-Pastoral-Comp', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae accumsan felis. Vestibulum vulputate sem id diam sagittis, sed varius nisl placerat. Curabitur pellentesque dolor varius, vehicula dui a, dapibus dui. Aliquam congue sapien ac sapien vulputate bibendum. Aenean tempor volutpat elit quis tristique. Fusce eu mattis ante, nec fringilla elit. Aliquam magna libero, molestie vel luctus eu, molestie eu erat. Pellentesque bibendum, augue id vestibulum dapibus, libero urna ultrices urna, eu malesuada sem nunc et felis. Fusce bibendum tortor non tortor tempor ullamcorper. Sed venenatis at nibh et pulvinar. Etiam nisl nisl, hendrerit et est vitae, hendrerit porttitor est.', '2016-04-07',null),
('Lesson A!', 1, 1, 1, '/components/com_pbacademy/images/lessons/PastoralComp.png', 'Ron Bell''s vast wisdom and knowledge', 'https://www.brainshark.com/pbusa/Structuring-Pastoral-Comp', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae accumsan felis. Vestibulum vulputate sem id diam sagittis, sed varius nisl placerat. Curabitur pellentesque dolor varius, vehicula dui a, dapibus dui. Aliquam congue sapien ac sapien vulputate bibendum. Aenean tempor volutpat elit quis tristique. Fusce eu mattis ante, nec fringilla elit. Aliquam magna libero, molestie vel luctus eu, molestie eu erat. Pellentesque bibendum, augue id vestibulum dapibus, libero urna ultrices urna, eu malesuada sem nunc et felis. Fusce bibendum tortor non tortor tempor ullamcorper. Sed venenatis at nibh et pulvinar. Etiam nisl nisl, hendrerit et est vitae, hendrerit porttitor est.', '2016-04-01',3),
('Lesson B?', 2, 2, 1, 'http://placekitten.com/600/337', 'A sloth hanging from a tree', 'https://www.brainshark.com/pbusa/Structuring-Pastoral-Comp', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae accumsan felis. Vestibulum vulputate sem id diam sagittis, sed varius nisl placerat. Curabitur pellentesque dolor varius, vehicula dui a, dapibus dui. Aliquam congue sapien ac sapien vulputate bibendum. Aenean tempor volutpat elit quis tristique. Fusce eu mattis ante, nec fringilla elit. Aliquam magna libero, molestie vel luctus eu, molestie eu erat. Pellentesque bibendum, augue id vestibulum dapibus, libero urna ultrices urna, eu malesuada sem nunc et felis. Fusce bibendum tortor non tortor tempor ullamcorper. Sed venenatis at nibh et pulvinar. Etiam nisl nisl, hendrerit et est vitae, hendrerit porttitor est.', '2016-03-31',3),
('Lesson C.', 1, 3, 1, 'http://lorempixel.com/600/337', '<a href="http://nazarene.org">Nazarene.org</a>"', 'https://www.brainshark.com/pbusa/Structuring-Pastoral-Comp', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae accumsan felis. Vestibulum vulputate sem id diam sagittis, sed varius nisl placerat. Curabitur pellentesque dolor varius, vehicula dui a, dapibus dui. Aliquam congue sapien ac sapien vulputate bibendum. Aenean tempor volutpat elit quis tristique. Fusce eu mattis ante, nec fringilla elit. Aliquam magna libero, molestie vel luctus eu, molestie eu erat. Pellentesque bibendum, augue id vestibulum dapibus, libero urna ultrices urna, eu malesuada sem nunc et felis. Fusce bibendum tortor non tortor tempor ullamcorper. Sed venenatis at nibh et pulvinar. Etiam nisl nisl, hendrerit et est vitae, hendrerit porttitor est.', '2016-03-30',2),
('Lesson D.', null, 1, 1, '/components/com_pbacademy/images/lessons/PastoralComp.png', NULL, 'https://www.brainshark.com/pbusa/Structuring-Pastoral-Comp', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae accumsan felis. Vestibulum vulputate sem id diam sagittis, sed varius nisl placerat. Curabitur pellentesque dolor varius, vehicula dui a, dapibus dui. Aliquam congue sapien ac sapien vulputate bibendum. Aenean tempor volutpat elit quis tristique. Fusce eu mattis ante, nec fringilla elit. Aliquam magna libero, molestie vel luctus eu, molestie eu erat. Pellentesque bibendum, augue id vestibulum dapibus, libero urna ultrices urna, eu malesuada sem nunc et felis. Fusce bibendum tortor non tortor tempor ullamcorper. Sed venenatis at nibh et pulvinar. Etiam nisl nisl, hendrerit et est vitae, hendrerit porttitor est.', '2016-03-29',null),
('Lesson E!', null, 2, 1, 'http://lorempixel.com/600/337', NULL, 'https://www.brainshark.com/pbusa/Structuring-Pastoral-Comp', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae accumsan felis. Vestibulum vulputate sem id diam sagittis, sed varius nisl placerat. Curabitur pellentesque dolor varius, vehicula dui a, dapibus dui. Aliquam congue sapien ac sapien vulputate bibendum. Aenean tempor volutpat elit quis tristique. Fusce eu mattis ante, nec fringilla elit. Aliquam magna libero, molestie vel luctus eu, molestie eu erat. Pellentesque bibendum, augue id vestibulum dapibus, libero urna ultrices urna, eu malesuada sem nunc et felis. Fusce bibendum tortor non tortor tempor ullamcorper. Sed venenatis at nibh et pulvinar. Etiam nisl nisl, hendrerit et est vitae, hendrerit porttitor est.', '2016-03-28',null),
('Lesson A!', 1, 1, 1, '/components/com_pbacademy/images/lessons/PastoralComp.png', 'Ron Bell''s vast wisdom and knowledge', 'https://www.brainshark.com/pbusa/Structuring-Pastoral-Comp', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae accumsan felis. Vestibulum vulputate sem id diam sagittis, sed varius nisl placerat. Curabitur pellentesque dolor varius, vehicula dui a, dapibus dui. Aliquam congue sapien ac sapien vulputate bibendum. Aenean tempor volutpat elit quis tristique. Fusce eu mattis ante, nec fringilla elit. Aliquam magna libero, molestie vel luctus eu, molestie eu erat. Pellentesque bibendum, augue id vestibulum dapibus, libero urna ultrices urna, eu malesuada sem nunc et felis. Fusce bibendum tortor non tortor tempor ullamcorper. Sed venenatis at nibh et pulvinar. Etiam nisl nisl, hendrerit et est vitae, hendrerit porttitor est.', '2016-04-07',4),
('Lesson B?', 2, 2, 1, 'http://placekitten.com/600/337', 'A sloth hanging from a tree', 'https://www.brainshark.com/pbusa/Structuring-Pastoral-Comp', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae accumsan felis. Vestibulum vulputate sem id diam sagittis, sed varius nisl placerat. Curabitur pellentesque dolor varius, vehicula dui a, dapibus dui. Aliquam congue sapien ac sapien vulputate bibendum. Aenean tempor volutpat elit quis tristique. Fusce eu mattis ante, nec fringilla elit. Aliquam magna libero, molestie vel luctus eu, molestie eu erat. Pellentesque bibendum, augue id vestibulum dapibus, libero urna ultrices urna, eu malesuada sem nunc et felis. Fusce bibendum tortor non tortor tempor ullamcorper. Sed venenatis at nibh et pulvinar. Etiam nisl nisl, hendrerit et est vitae, hendrerit porttitor est.', '2016-03-27',4),
('Lesson C.', 1, 3, 1, 'http://lorempixel.com/600/337', '<a href="http://nazarene.org">Nazarene.org</a>"', 'https://www.brainshark.com/pbusa/Structuring-Pastoral-Comp', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae accumsan felis. Vestibulum vulputate sem id diam sagittis, sed varius nisl placerat. Curabitur pellentesque dolor varius, vehicula dui a, dapibus dui. Aliquam congue sapien ac sapien vulputate bibendum. Aenean tempor volutpat elit quis tristique. Fusce eu mattis ante, nec fringilla elit. Aliquam magna libero, molestie vel luctus eu, molestie eu erat. Pellentesque bibendum, augue id vestibulum dapibus, libero urna ultrices urna, eu malesuada sem nunc et felis. Fusce bibendum tortor non tortor tempor ullamcorper. Sed venenatis at nibh et pulvinar. Etiam nisl nisl, hendrerit et est vitae, hendrerit porttitor est.', '2016-03-26',4),
('Lesson D.', null, 1, 1, '/components/com_pbacademy/images/lessons/PastoralComp.png', NULL, 'https://www.brainshark.com/pbusa/Structuring-Pastoral-Comp', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae accumsan felis. Vestibulum vulputate sem id diam sagittis, sed varius nisl placerat. Curabitur pellentesque dolor varius, vehicula dui a, dapibus dui. Aliquam congue sapien ac sapien vulputate bibendum. Aenean tempor volutpat elit quis tristique. Fusce eu mattis ante, nec fringilla elit. Aliquam magna libero, molestie vel luctus eu, molestie eu erat. Pellentesque bibendum, augue id vestibulum dapibus, libero urna ultrices urna, eu malesuada sem nunc et felis. Fusce bibendum tortor non tortor tempor ullamcorper. Sed venenatis at nibh et pulvinar. Etiam nisl nisl, hendrerit et est vitae, hendrerit porttitor est.', '2016-03-25',null),
('Lesson E!', null, 2, 1, 'http://lorempixel.com/600/337', NULL, 'https://www.brainshark.com/pbusa/Structuring-Pastoral-Comp', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae accumsan felis. Vestibulum vulputate sem id diam sagittis, sed varius nisl placerat. Curabitur pellentesque dolor varius, vehicula dui a, dapibus dui. Aliquam congue sapien ac sapien vulputate bibendum. Aenean tempor volutpat elit quis tristique. Fusce eu mattis ante, nec fringilla elit. Aliquam magna libero, molestie vel luctus eu, molestie eu erat. Pellentesque bibendum, augue id vestibulum dapibus, libero urna ultrices urna, eu malesuada sem nunc et felis. Fusce bibendum tortor non tortor tempor ullamcorper. Sed venenatis at nibh et pulvinar. Etiam nisl nisl, hendrerit et est vitae, hendrerit porttitor est.', '2016-03-24',null);
