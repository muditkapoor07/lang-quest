-- Languages
INSERT INTO languages (name, code, flag_emoji) VALUES
  ('French', 'fr', '🇫🇷'),
  ('Spanish', 'es', '🇪🇸'),
  ('German', 'de', '🇩🇪'),
  ('Italian', 'it', '🇮🇹'),
  ('Japanese', 'ja', '🇯🇵')
ON CONFLICT DO NOTHING;

-- =====================
-- FRENCH LESSONS
-- =====================
INSERT INTO lessons (language_id, title, "order") VALUES
  (1, 'Colors', 1),
  (1, 'Numbers', 2),
  (1, 'Greetings', 3),
  (1, 'Animals', 4),
  (1, 'Food & Drinks', 5)
ON CONFLICT DO NOTHING;

-- French Colors vocab
INSERT INTO vocab_items (lesson_id, term, translation) VALUES
  (1, 'Rouge', 'Red'),
  (1, 'Bleu', 'Blue'),
  (1, 'Vert', 'Green'),
  (1, 'Jaune', 'Yellow'),
  (1, 'Noir', 'Black'),
  (1, 'Blanc', 'White');

-- French Numbers vocab
INSERT INTO vocab_items (lesson_id, term, translation) VALUES
  (2, 'Un', 'One'),
  (2, 'Deux', 'Two'),
  (2, 'Trois', 'Three'),
  (2, 'Quatre', 'Four'),
  (2, 'Cinq', 'Five'),
  (2, 'Six', 'Six');

-- French Greetings vocab
INSERT INTO vocab_items (lesson_id, term, translation) VALUES
  (3, 'Bonjour', 'Hello'),
  (3, 'Au revoir', 'Goodbye'),
  (3, 'Merci', 'Thank you'),
  (3, 'S''il vous plaît', 'Please'),
  (3, 'Oui', 'Yes'),
  (3, 'Non', 'No');

-- French Animals vocab
INSERT INTO vocab_items (lesson_id, term, translation) VALUES
  (4, 'Chat', 'Cat'),
  (4, 'Chien', 'Dog'),
  (4, 'Oiseau', 'Bird'),
  (4, 'Poisson', 'Fish'),
  (4, 'Cheval', 'Horse'),
  (4, 'Lion', 'Lion');

-- French Food vocab
INSERT INTO vocab_items (lesson_id, term, translation) VALUES
  (5, 'Pain', 'Bread'),
  (5, 'Eau', 'Water'),
  (5, 'Lait', 'Milk'),
  (5, 'Fromage', 'Cheese'),
  (5, 'Pomme', 'Apple'),
  (5, 'Café', 'Coffee');

-- French Colors quiz questions
INSERT INTO quiz_questions (lesson_id, prompt, correct_option, options) VALUES
  (1, 'What does ''Rouge'' mean?', 'Red', '["Red", "Blue", "Green", "Yellow"]'),
  (1, 'What does ''Bleu'' mean?', 'Blue', '["Red", "Blue", "Black", "White"]'),
  (1, 'What does ''Vert'' mean?', 'Green', '["Yellow", "Purple", "Green", "Orange"]'),
  (1, 'What does ''Jaune'' mean?', 'Yellow', '["Yellow", "Green", "Blue", "Red"]'),
  (1, 'What does ''Noir'' mean?', 'Black', '["White", "Gray", "Black", "Brown"]'),
  (1, 'What does ''Blanc'' mean?', 'White', '["Black", "White", "Yellow", "Green"]');

-- French Numbers quiz
INSERT INTO quiz_questions (lesson_id, prompt, correct_option, options) VALUES
  (2, 'What does ''Un'' mean?', 'One', '["One", "Two", "Three", "Four"]'),
  (2, 'What does ''Deux'' mean?', 'Two', '["One", "Two", "Five", "Six"]'),
  (2, 'What does ''Trois'' mean?', 'Three', '["Four", "Three", "Two", "One"]'),
  (2, 'What does ''Quatre'' mean?', 'Four', '["Five", "Six", "Three", "Four"]'),
  (2, 'What does ''Cinq'' mean?', 'Five', '["Four", "Five", "Six", "Two"]'),
  (2, 'What does ''Six'' mean?', 'Six', '["Five", "Six", "One", "Three"]');

-- French Greetings quiz
INSERT INTO quiz_questions (lesson_id, prompt, correct_option, options) VALUES
  (3, 'What does ''Bonjour'' mean?', 'Hello', '["Hello", "Goodbye", "Please", "Thank you"]'),
  (3, 'What does ''Au revoir'' mean?', 'Goodbye', '["Hello", "Goodbye", "Yes", "No"]'),
  (3, 'What does ''Merci'' mean?', 'Thank you', '["Please", "Thank you", "Hello", "Goodbye"]'),
  (3, 'What does ''S''il vous plaît'' mean?', 'Please', '["Please", "Thank you", "Yes", "No"]'),
  (3, 'What does ''Oui'' mean?', 'Yes', '["No", "Yes", "Hello", "Goodbye"]'),
  (3, 'What does ''Non'' mean?', 'No', '["Yes", "No", "Please", "Thank you"]');

-- French Animals quiz
INSERT INTO quiz_questions (lesson_id, prompt, correct_option, options) VALUES
  (4, 'What does ''Chat'' mean?', 'Cat', '["Cat", "Dog", "Bird", "Fish"]'),
  (4, 'What does ''Chien'' mean?', 'Dog', '["Cat", "Dog", "Horse", "Lion"]'),
  (4, 'What does ''Oiseau'' mean?', 'Bird', '["Fish", "Bird", "Cat", "Dog"]'),
  (4, 'What does ''Poisson'' mean?', 'Fish', '["Fish", "Bird", "Horse", "Lion"]'),
  (4, 'What does ''Cheval'' mean?', 'Horse', '["Cat", "Dog", "Bird", "Horse"]'),
  (4, 'What does ''Lion'' mean?', 'Lion', '["Fish", "Horse", "Lion", "Bird"]');

-- French Food quiz
INSERT INTO quiz_questions (lesson_id, prompt, correct_option, options) VALUES
  (5, 'What does ''Pain'' mean?', 'Bread', '["Bread", "Water", "Milk", "Cheese"]'),
  (5, 'What does ''Eau'' mean?', 'Water', '["Bread", "Water", "Apple", "Coffee"]'),
  (5, 'What does ''Lait'' mean?', 'Milk', '["Cheese", "Milk", "Water", "Bread"]'),
  (5, 'What does ''Fromage'' mean?', 'Cheese', '["Cheese", "Apple", "Milk", "Coffee"]'),
  (5, 'What does ''Pomme'' mean?', 'Apple', '["Bread", "Apple", "Coffee", "Water"]'),
  (5, 'What does ''Café'' mean?', 'Coffee', '["Milk", "Coffee", "Cheese", "Apple"]');

-- =====================
-- SPANISH LESSONS
-- =====================
INSERT INTO lessons (language_id, title, "order") VALUES
  (2, 'Colors', 1),
  (2, 'Numbers', 2),
  (2, 'Greetings', 3),
  (2, 'Animals', 4),
  (2, 'Food & Drinks', 5)
ON CONFLICT DO NOTHING;

-- Spanish Colors
INSERT INTO vocab_items (lesson_id, term, translation) VALUES
  (6, 'Rojo', 'Red'),
  (6, 'Azul', 'Blue'),
  (6, 'Verde', 'Green'),
  (6, 'Amarillo', 'Yellow'),
  (6, 'Negro', 'Black'),
  (6, 'Blanco', 'White');

INSERT INTO vocab_items (lesson_id, term, translation) VALUES
  (7, 'Uno', 'One'),
  (7, 'Dos', 'Two'),
  (7, 'Tres', 'Three'),
  (7, 'Cuatro', 'Four'),
  (7, 'Cinco', 'Five'),
  (7, 'Seis', 'Six');

INSERT INTO vocab_items (lesson_id, term, translation) VALUES
  (8, 'Hola', 'Hello'),
  (8, 'Adiós', 'Goodbye'),
  (8, 'Gracias', 'Thank you'),
  (8, 'Por favor', 'Please'),
  (8, 'Sí', 'Yes'),
  (8, 'No', 'No');

INSERT INTO vocab_items (lesson_id, term, translation) VALUES
  (9, 'Gato', 'Cat'),
  (9, 'Perro', 'Dog'),
  (9, 'Pájaro', 'Bird'),
  (9, 'Pez', 'Fish'),
  (9, 'Caballo', 'Horse'),
  (9, 'León', 'Lion');

INSERT INTO vocab_items (lesson_id, term, translation) VALUES
  (10, 'Pan', 'Bread'),
  (10, 'Agua', 'Water'),
  (10, 'Leche', 'Milk'),
  (10, 'Queso', 'Cheese'),
  (10, 'Manzana', 'Apple'),
  (10, 'Café', 'Coffee');

-- Spanish quiz questions
INSERT INTO quiz_questions (lesson_id, prompt, correct_option, options) VALUES
  (6, 'What does ''Rojo'' mean?', 'Red', '["Red", "Blue", "Green", "Yellow"]'),
  (6, 'What does ''Azul'' mean?', 'Blue', '["Red", "Blue", "Black", "White"]'),
  (6, 'What does ''Verde'' mean?', 'Green', '["Yellow", "Purple", "Green", "Orange"]'),
  (6, 'What does ''Amarillo'' mean?', 'Yellow', '["Yellow", "Green", "Blue", "Red"]'),
  (6, 'What does ''Negro'' mean?', 'Black', '["White", "Gray", "Black", "Brown"]'),
  (6, 'What does ''Blanco'' mean?', 'White', '["Black", "White", "Yellow", "Green"]');

INSERT INTO quiz_questions (lesson_id, prompt, correct_option, options) VALUES
  (7, 'What does ''Uno'' mean?', 'One', '["One", "Two", "Three", "Four"]'),
  (7, 'What does ''Dos'' mean?', 'Two', '["One", "Two", "Five", "Six"]'),
  (7, 'What does ''Tres'' mean?', 'Three', '["Four", "Three", "Two", "One"]'),
  (7, 'What does ''Cuatro'' mean?', 'Four', '["Five", "Six", "Three", "Four"]'),
  (7, 'What does ''Cinco'' mean?', 'Five', '["Four", "Five", "Six", "Two"]'),
  (7, 'What does ''Seis'' mean?', 'Six', '["Five", "Six", "One", "Three"]');

INSERT INTO quiz_questions (lesson_id, prompt, correct_option, options) VALUES
  (8, 'What does ''Hola'' mean?', 'Hello', '["Hello", "Goodbye", "Please", "Thank you"]'),
  (8, 'What does ''Adiós'' mean?', 'Goodbye', '["Hello", "Goodbye", "Yes", "No"]'),
  (8, 'What does ''Gracias'' mean?', 'Thank you', '["Please", "Thank you", "Hello", "Goodbye"]'),
  (8, 'What does ''Por favor'' mean?', 'Please', '["Please", "Thank you", "Yes", "No"]'),
  (8, 'What does ''Sí'' mean?', 'Yes', '["No", "Yes", "Hello", "Goodbye"]'),
  (8, 'What does ''No'' mean?', 'No', '["Yes", "No", "Please", "Thank you"]');

INSERT INTO quiz_questions (lesson_id, prompt, correct_option, options) VALUES
  (9, 'What does ''Gato'' mean?', 'Cat', '["Cat", "Dog", "Bird", "Fish"]'),
  (9, 'What does ''Perro'' mean?', 'Dog', '["Cat", "Dog", "Horse", "Lion"]'),
  (9, 'What does ''Pájaro'' mean?', 'Bird', '["Fish", "Bird", "Cat", "Dog"]'),
  (9, 'What does ''Pez'' mean?', 'Fish', '["Fish", "Bird", "Horse", "Lion"]'),
  (9, 'What does ''Caballo'' mean?', 'Horse', '["Cat", "Dog", "Bird", "Horse"]'),
  (9, 'What does ''León'' mean?', 'Lion', '["Fish", "Horse", "Lion", "Bird"]');

INSERT INTO quiz_questions (lesson_id, prompt, correct_option, options) VALUES
  (10, 'What does ''Pan'' mean?', 'Bread', '["Bread", "Water", "Milk", "Cheese"]'),
  (10, 'What does ''Agua'' mean?', 'Water', '["Bread", "Water", "Apple", "Coffee"]'),
  (10, 'What does ''Leche'' mean?', 'Milk', '["Cheese", "Milk", "Water", "Bread"]'),
  (10, 'What does ''Queso'' mean?', 'Cheese', '["Cheese", "Apple", "Milk", "Coffee"]'),
  (10, 'What does ''Manzana'' mean?', 'Apple', '["Bread", "Apple", "Coffee", "Water"]'),
  (10, 'What does ''Café'' mean?', 'Coffee', '["Milk", "Coffee", "Cheese", "Apple"]');

-- =====================
-- GERMAN LESSONS
-- =====================
INSERT INTO lessons (language_id, title, "order") VALUES
  (3, 'Colors', 1),
  (3, 'Numbers', 2),
  (3, 'Greetings', 3),
  (3, 'Animals', 4),
  (3, 'Food & Drinks', 5)
ON CONFLICT DO NOTHING;

INSERT INTO vocab_items (lesson_id, term, translation) VALUES
  (11, 'Rot', 'Red'),
  (11, 'Blau', 'Blue'),
  (11, 'Grün', 'Green'),
  (11, 'Gelb', 'Yellow'),
  (11, 'Schwarz', 'Black'),
  (11, 'Weiß', 'White');

INSERT INTO vocab_items (lesson_id, term, translation) VALUES
  (12, 'Eins', 'One'),
  (12, 'Zwei', 'Two'),
  (12, 'Drei', 'Three'),
  (12, 'Vier', 'Four'),
  (12, 'Fünf', 'Five'),
  (12, 'Sechs', 'Six');

INSERT INTO vocab_items (lesson_id, term, translation) VALUES
  (13, 'Hallo', 'Hello'),
  (13, 'Auf Wiedersehen', 'Goodbye'),
  (13, 'Danke', 'Thank you'),
  (13, 'Bitte', 'Please'),
  (13, 'Ja', 'Yes'),
  (13, 'Nein', 'No');

INSERT INTO vocab_items (lesson_id, term, translation) VALUES
  (14, 'Katze', 'Cat'),
  (14, 'Hund', 'Dog'),
  (14, 'Vogel', 'Bird'),
  (14, 'Fisch', 'Fish'),
  (14, 'Pferd', 'Horse'),
  (14, 'Löwe', 'Lion');

INSERT INTO vocab_items (lesson_id, term, translation) VALUES
  (15, 'Brot', 'Bread'),
  (15, 'Wasser', 'Water'),
  (15, 'Milch', 'Milk'),
  (15, 'Käse', 'Cheese'),
  (15, 'Apfel', 'Apple'),
  (15, 'Kaffee', 'Coffee');

INSERT INTO quiz_questions (lesson_id, prompt, correct_option, options) VALUES
  (11, 'What does ''Rot'' mean?', 'Red', '["Red", "Blue", "Green", "Yellow"]'),
  (11, 'What does ''Blau'' mean?', 'Blue', '["Red", "Blue", "Black", "White"]'),
  (11, 'What does ''Grün'' mean?', 'Green', '["Yellow", "Purple", "Green", "Orange"]'),
  (11, 'What does ''Gelb'' mean?', 'Yellow', '["Yellow", "Green", "Blue", "Red"]'),
  (11, 'What does ''Schwarz'' mean?', 'Black', '["White", "Gray", "Black", "Brown"]'),
  (11, 'What does ''Weiß'' mean?', 'White', '["Black", "White", "Yellow", "Green"]');

INSERT INTO quiz_questions (lesson_id, prompt, correct_option, options) VALUES
  (12, 'What does ''Eins'' mean?', 'One', '["One", "Two", "Three", "Four"]'),
  (12, 'What does ''Zwei'' mean?', 'Two', '["One", "Two", "Five", "Six"]'),
  (12, 'What does ''Drei'' mean?', 'Three', '["Four", "Three", "Two", "One"]'),
  (12, 'What does ''Vier'' mean?', 'Four', '["Five", "Six", "Three", "Four"]'),
  (12, 'What does ''Fünf'' mean?', 'Five', '["Four", "Five", "Six", "Two"]'),
  (12, 'What does ''Sechs'' mean?', 'Six', '["Five", "Six", "One", "Three"]');

INSERT INTO quiz_questions (lesson_id, prompt, correct_option, options) VALUES
  (13, 'What does ''Hallo'' mean?', 'Hello', '["Hello", "Goodbye", "Please", "Thank you"]'),
  (13, 'What does ''Auf Wiedersehen'' mean?', 'Goodbye', '["Hello", "Goodbye", "Yes", "No"]'),
  (13, 'What does ''Danke'' mean?', 'Thank you', '["Please", "Thank you", "Hello", "Goodbye"]'),
  (13, 'What does ''Bitte'' mean?', 'Please', '["Please", "Thank you", "Yes", "No"]'),
  (13, 'What does ''Ja'' mean?', 'Yes', '["No", "Yes", "Hello", "Goodbye"]'),
  (13, 'What does ''Nein'' mean?', 'No', '["Yes", "No", "Please", "Thank you"]');

INSERT INTO quiz_questions (lesson_id, prompt, correct_option, options) VALUES
  (14, 'What does ''Katze'' mean?', 'Cat', '["Cat", "Dog", "Bird", "Fish"]'),
  (14, 'What does ''Hund'' mean?', 'Dog', '["Cat", "Dog", "Horse", "Lion"]'),
  (14, 'What does ''Vogel'' mean?', 'Bird', '["Fish", "Bird", "Cat", "Dog"]'),
  (14, 'What does ''Fisch'' mean?', 'Fish', '["Fish", "Bird", "Horse", "Lion"]'),
  (14, 'What does ''Pferd'' mean?', 'Horse', '["Cat", "Dog", "Bird", "Horse"]'),
  (14, 'What does ''Löwe'' mean?', 'Lion', '["Fish", "Horse", "Lion", "Bird"]');

INSERT INTO quiz_questions (lesson_id, prompt, correct_option, options) VALUES
  (15, 'What does ''Brot'' mean?', 'Bread', '["Bread", "Water", "Milk", "Cheese"]'),
  (15, 'What does ''Wasser'' mean?', 'Water', '["Bread", "Water", "Apple", "Coffee"]'),
  (15, 'What does ''Milch'' mean?', 'Milk', '["Cheese", "Milk", "Water", "Bread"]'),
  (15, 'What does ''Käse'' mean?', 'Cheese', '["Cheese", "Apple", "Milk", "Coffee"]'),
  (15, 'What does ''Apfel'' mean?', 'Apple', '["Bread", "Apple", "Coffee", "Water"]'),
  (15, 'What does ''Kaffee'' mean?', 'Coffee', '["Milk", "Coffee", "Cheese", "Apple"]');

-- =====================
-- ITALIAN LESSONS
-- =====================
INSERT INTO lessons (language_id, title, "order") VALUES
  (4, 'Colors', 1),
  (4, 'Numbers', 2),
  (4, 'Greetings', 3),
  (4, 'Animals', 4),
  (4, 'Food & Drinks', 5)
ON CONFLICT DO NOTHING;

INSERT INTO vocab_items (lesson_id, term, translation) VALUES
  (16, 'Rosso', 'Red'),
  (16, 'Blu', 'Blue'),
  (16, 'Verde', 'Green'),
  (16, 'Giallo', 'Yellow'),
  (16, 'Nero', 'Black'),
  (16, 'Bianco', 'White');

INSERT INTO vocab_items (lesson_id, term, translation) VALUES
  (17, 'Uno', 'One'),
  (17, 'Due', 'Two'),
  (17, 'Tre', 'Three'),
  (17, 'Quattro', 'Four'),
  (17, 'Cinque', 'Five'),
  (17, 'Sei', 'Six');

INSERT INTO vocab_items (lesson_id, term, translation) VALUES
  (18, 'Ciao', 'Hello'),
  (18, 'Arrivederci', 'Goodbye'),
  (18, 'Grazie', 'Thank you'),
  (18, 'Per favore', 'Please'),
  (18, 'Sì', 'Yes'),
  (18, 'No', 'No');

INSERT INTO vocab_items (lesson_id, term, translation) VALUES
  (19, 'Gatto', 'Cat'),
  (19, 'Cane', 'Dog'),
  (19, 'Uccello', 'Bird'),
  (19, 'Pesce', 'Fish'),
  (19, 'Cavallo', 'Horse'),
  (19, 'Leone', 'Lion');

INSERT INTO vocab_items (lesson_id, term, translation) VALUES
  (20, 'Pane', 'Bread'),
  (20, 'Acqua', 'Water'),
  (20, 'Latte', 'Milk'),
  (20, 'Formaggio', 'Cheese'),
  (20, 'Mela', 'Apple'),
  (20, 'Caffè', 'Coffee');

INSERT INTO quiz_questions (lesson_id, prompt, correct_option, options) VALUES
  (16, 'What does ''Rosso'' mean?', 'Red', '["Red", "Blue", "Green", "Yellow"]'),
  (16, 'What does ''Blu'' mean?', 'Blue', '["Red", "Blue", "Black", "White"]'),
  (16, 'What does ''Verde'' mean?', 'Green', '["Yellow", "Purple", "Green", "Orange"]'),
  (16, 'What does ''Giallo'' mean?', 'Yellow', '["Yellow", "Green", "Blue", "Red"]'),
  (16, 'What does ''Nero'' mean?', 'Black', '["White", "Gray", "Black", "Brown"]'),
  (16, 'What does ''Bianco'' mean?', 'White', '["Black", "White", "Yellow", "Green"]');

INSERT INTO quiz_questions (lesson_id, prompt, correct_option, options) VALUES
  (17, 'What does ''Uno'' mean?', 'One', '["One", "Two", "Three", "Four"]'),
  (17, 'What does ''Due'' mean?', 'Two', '["One", "Two", "Five", "Six"]'),
  (17, 'What does ''Tre'' mean?', 'Three', '["Four", "Three", "Two", "One"]'),
  (17, 'What does ''Quattro'' mean?', 'Four', '["Five", "Six", "Three", "Four"]'),
  (17, 'What does ''Cinque'' mean?', 'Five', '["Four", "Five", "Six", "Two"]'),
  (17, 'What does ''Sei'' mean?', 'Six', '["Five", "Six", "One", "Three"]');

INSERT INTO quiz_questions (lesson_id, prompt, correct_option, options) VALUES
  (18, 'What does ''Ciao'' mean?', 'Hello', '["Hello", "Goodbye", "Please", "Thank you"]'),
  (18, 'What does ''Arrivederci'' mean?', 'Goodbye', '["Hello", "Goodbye", "Yes", "No"]'),
  (18, 'What does ''Grazie'' mean?', 'Thank you', '["Please", "Thank you", "Hello", "Goodbye"]'),
  (18, 'What does ''Per favore'' mean?', 'Please', '["Please", "Thank you", "Yes", "No"]'),
  (18, 'What does ''Sì'' mean?', 'Yes', '["No", "Yes", "Hello", "Goodbye"]'),
  (18, 'What does ''No'' mean?', 'No', '["Yes", "No", "Please", "Thank you"]');

INSERT INTO quiz_questions (lesson_id, prompt, correct_option, options) VALUES
  (19, 'What does ''Gatto'' mean?', 'Cat', '["Cat", "Dog", "Bird", "Fish"]'),
  (19, 'What does ''Cane'' mean?', 'Dog', '["Cat", "Dog", "Horse", "Lion"]'),
  (19, 'What does ''Uccello'' mean?', 'Bird', '["Fish", "Bird", "Cat", "Dog"]'),
  (19, 'What does ''Pesce'' mean?', 'Fish', '["Fish", "Bird", "Horse", "Lion"]'),
  (19, 'What does ''Cavallo'' mean?', 'Horse', '["Cat", "Dog", "Bird", "Horse"]'),
  (19, 'What does ''Leone'' mean?', 'Lion', '["Fish", "Horse", "Lion", "Bird"]');

INSERT INTO quiz_questions (lesson_id, prompt, correct_option, options) VALUES
  (20, 'What does ''Pane'' mean?', 'Bread', '["Bread", "Water", "Milk", "Cheese"]'),
  (20, 'What does ''Acqua'' mean?', 'Water', '["Bread", "Water", "Apple", "Coffee"]'),
  (20, 'What does ''Latte'' mean?', 'Milk', '["Cheese", "Milk", "Water", "Bread"]'),
  (20, 'What does ''Formaggio'' mean?', 'Cheese', '["Cheese", "Apple", "Milk", "Coffee"]'),
  (20, 'What does ''Mela'' mean?', 'Apple', '["Bread", "Apple", "Coffee", "Water"]'),
  (20, 'What does ''Caffè'' mean?', 'Coffee', '["Milk", "Coffee", "Cheese", "Apple"]');

-- =====================
-- JAPANESE LESSONS
-- =====================
INSERT INTO lessons (language_id, title, "order") VALUES
  (5, 'Colors', 1),
  (5, 'Numbers', 2),
  (5, 'Greetings', 3),
  (5, 'Animals', 4),
  (5, 'Food & Drinks', 5)
ON CONFLICT DO NOTHING;

INSERT INTO vocab_items (lesson_id, term, translation) VALUES
  (21, 'Aka (赤)', 'Red'),
  (21, 'Ao (青)', 'Blue'),
  (21, 'Midori (緑)', 'Green'),
  (21, 'Kiiro (黄色)', 'Yellow'),
  (21, 'Kuro (黒)', 'Black'),
  (21, 'Shiro (白)', 'White');

INSERT INTO vocab_items (lesson_id, term, translation) VALUES
  (22, 'Ichi (一)', 'One'),
  (22, 'Ni (二)', 'Two'),
  (22, 'San (三)', 'Three'),
  (22, 'Shi (四)', 'Four'),
  (22, 'Go (五)', 'Five'),
  (22, 'Roku (六)', 'Six');

INSERT INTO vocab_items (lesson_id, term, translation) VALUES
  (23, 'Konnichiwa (こんにちは)', 'Hello'),
  (23, 'Sayonara (さようなら)', 'Goodbye'),
  (23, 'Arigatou (ありがとう)', 'Thank you'),
  (23, 'Onegai (おねがい)', 'Please'),
  (23, 'Hai (はい)', 'Yes'),
  (23, 'Iie (いいえ)', 'No');

INSERT INTO vocab_items (lesson_id, term, translation) VALUES
  (24, 'Neko (猫)', 'Cat'),
  (24, 'Inu (犬)', 'Dog'),
  (24, 'Tori (鳥)', 'Bird'),
  (24, 'Sakana (魚)', 'Fish'),
  (24, 'Uma (馬)', 'Horse'),
  (24, 'Raion (ライオン)', 'Lion');

INSERT INTO vocab_items (lesson_id, term, translation) VALUES
  (25, 'Pan (パン)', 'Bread'),
  (25, 'Mizu (水)', 'Water'),
  (25, 'Miruku (ミルク)', 'Milk'),
  (25, 'Chiizu (チーズ)', 'Cheese'),
  (25, 'Ringo (りんご)', 'Apple'),
  (25, 'Koohii (コーヒー)', 'Coffee');

INSERT INTO quiz_questions (lesson_id, prompt, correct_option, options) VALUES
  (21, 'What does ''Aka (赤)'' mean?', 'Red', '["Red", "Blue", "Green", "Yellow"]'),
  (21, 'What does ''Ao (青)'' mean?', 'Blue', '["Red", "Blue", "Black", "White"]'),
  (21, 'What does ''Midori (緑)'' mean?', 'Green', '["Yellow", "Purple", "Green", "Orange"]'),
  (21, 'What does ''Kiiro (黄色)'' mean?', 'Yellow', '["Yellow", "Green", "Blue", "Red"]'),
  (21, 'What does ''Kuro (黒)'' mean?', 'Black', '["White", "Gray", "Black", "Brown"]'),
  (21, 'What does ''Shiro (白)'' mean?', 'White', '["Black", "White", "Yellow", "Green"]');

INSERT INTO quiz_questions (lesson_id, prompt, correct_option, options) VALUES
  (22, 'What does ''Ichi (一)'' mean?', 'One', '["One", "Two", "Three", "Four"]'),
  (22, 'What does ''Ni (二)'' mean?', 'Two', '["One", "Two", "Five", "Six"]'),
  (22, 'What does ''San (三)'' mean?', 'Three', '["Four", "Three", "Two", "One"]'),
  (22, 'What does ''Shi (四)'' mean?', 'Four', '["Five", "Six", "Three", "Four"]'),
  (22, 'What does ''Go (五)'' mean?', 'Five', '["Four", "Five", "Six", "Two"]'),
  (22, 'What does ''Roku (六)'' mean?', 'Six', '["Five", "Six", "One", "Three"]');

INSERT INTO quiz_questions (lesson_id, prompt, correct_option, options) VALUES
  (23, 'What does ''Konnichiwa'' mean?', 'Hello', '["Hello", "Goodbye", "Please", "Thank you"]'),
  (23, 'What does ''Sayonara'' mean?', 'Goodbye', '["Hello", "Goodbye", "Yes", "No"]'),
  (23, 'What does ''Arigatou'' mean?', 'Thank you', '["Please", "Thank you", "Hello", "Goodbye"]'),
  (23, 'What does ''Onegai'' mean?', 'Please', '["Please", "Thank you", "Yes", "No"]'),
  (23, 'What does ''Hai'' mean?', 'Yes', '["No", "Yes", "Hello", "Goodbye"]'),
  (23, 'What does ''Iie'' mean?', 'No', '["Yes", "No", "Please", "Thank you"]');

INSERT INTO quiz_questions (lesson_id, prompt, correct_option, options) VALUES
  (24, 'What does ''Neko'' mean?', 'Cat', '["Cat", "Dog", "Bird", "Fish"]'),
  (24, 'What does ''Inu'' mean?', 'Dog', '["Cat", "Dog", "Horse", "Lion"]'),
  (24, 'What does ''Tori'' mean?', 'Bird', '["Fish", "Bird", "Cat", "Dog"]'),
  (24, 'What does ''Sakana'' mean?', 'Fish', '["Fish", "Bird", "Horse", "Lion"]'),
  (24, 'What does ''Uma'' mean?', 'Horse', '["Cat", "Dog", "Bird", "Horse"]'),
  (24, 'What does ''Raion'' mean?', 'Lion', '["Fish", "Horse", "Lion", "Bird"]');

INSERT INTO quiz_questions (lesson_id, prompt, correct_option, options) VALUES
  (25, 'What does ''Pan (パン)'' mean?', 'Bread', '["Bread", "Water", "Milk", "Cheese"]'),
  (25, 'What does ''Mizu (水)'' mean?', 'Water', '["Bread", "Water", "Apple", "Coffee"]'),
  (25, 'What does ''Miruku'' mean?', 'Milk', '["Cheese", "Milk", "Water", "Bread"]'),
  (25, 'What does ''Chiizu'' mean?', 'Cheese', '["Cheese", "Apple", "Milk", "Coffee"]'),
  (25, 'What does ''Ringo'' mean?', 'Apple', '["Bread", "Apple", "Coffee", "Water"]'),
  (25, 'What does ''Koohii'' mean?', 'Coffee', '["Milk", "Coffee", "Cheese", "Apple"]');
