CREATE TABLE `indexes` (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `item` varchar(100) NOT NULL,
                           `page_number` varchar(3) NOT NULL,
                           `book_id` int NOT NULL,
                           PRIMARY KEY (`id`),
                           KEY `book_indexes_idx` (`book_id`),
                           CONSTRAINT `book_indexes` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci