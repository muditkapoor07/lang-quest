-- Add English and Hindi languages
INSERT INTO languages (name, code, flag_emoji) VALUES
  ('English', 'en', '🇺🇸'),
  ('Hindi', 'hi', '🇮🇳')
ON CONFLICT DO NOTHING;

-- =====================
-- ENGLISH LESSONS (language_id = 6)
-- =====================
INSERT INTO lessons (language_id, title, "order")
SELECT id, 'Colors', 1 FROM languages WHERE code='en'
ON CONFLICT DO NOTHING;
INSERT INTO lessons (language_id, title, "order")
SELECT id, 'Numbers', 2 FROM languages WHERE code='en'
ON CONFLICT DO NOTHING;
INSERT INTO lessons (language_id, title, "order")
SELECT id, 'Greetings', 3 FROM languages WHERE code='en'
ON CONFLICT DO NOTHING;
INSERT INTO lessons (language_id, title, "order")
SELECT id, 'Animals', 4 FROM languages WHERE code='en'
ON CONFLICT DO NOTHING;
INSERT INTO lessons (language_id, title, "order")
SELECT id, 'Food & Drinks', 5 FROM languages WHERE code='en'
ON CONFLICT DO NOTHING;

-- English Colors vocab
INSERT INTO vocab_items (lesson_id, term, translation)
SELECT l.id, v.term, v.translation FROM lessons l
JOIN languages lang ON lang.id = l.language_id
CROSS JOIN (VALUES
  ('Crimson', 'Deep Red'),
  ('Azure', 'Sky Blue'),
  ('Emerald', 'Bright Green'),
  ('Golden', 'Yellow'),
  ('Ebony', 'Black'),
  ('Pearl', 'White')
) AS v(term, translation)
WHERE lang.code = 'en' AND l.title = 'Colors';

-- English Numbers vocab
INSERT INTO vocab_items (lesson_id, term, translation)
SELECT l.id, v.term, v.translation FROM lessons l
JOIN languages lang ON lang.id = l.language_id
CROSS JOIN (VALUES
  ('Eleven', 'Eleven (11)'),
  ('Twenty', 'Twenty (20)'),
  ('Thirty', 'Thirty (30)'),
  ('Fifty', 'Fifty (50)'),
  ('Hundred', 'One Hundred (100)'),
  ('Thousand', 'One Thousand (1000)')
) AS v(term, translation)
WHERE lang.code = 'en' AND l.title = 'Numbers';

-- English Greetings vocab
INSERT INTO vocab_items (lesson_id, term, translation)
SELECT l.id, v.term, v.translation FROM lessons l
JOIN languages lang ON lang.id = l.language_id
CROSS JOIN (VALUES
  ('Good morning', 'Morning greeting'),
  ('Good evening', 'Evening greeting'),
  ('How do you do', 'Formal greeting'),
  ('Take care', 'Farewell wish'),
  ('You''re welcome', 'Response to thanks'),
  ('Excuse me', 'Polite interruption')
) AS v(term, translation)
WHERE lang.code = 'en' AND l.title = 'Greetings';

-- English Animals vocab
INSERT INTO vocab_items (lesson_id, term, translation)
SELECT l.id, v.term, v.translation FROM lessons l
JOIN languages lang ON lang.id = l.language_id
CROSS JOIN (VALUES
  ('Feline', 'Cat'),
  ('Canine', 'Dog'),
  ('Avian', 'Bird'),
  ('Aquatic', 'Fish'),
  ('Equine', 'Horse'),
  ('Mane', 'Lion''s hair')
) AS v(term, translation)
WHERE lang.code = 'en' AND l.title = 'Animals';

-- English Food vocab
INSERT INTO vocab_items (lesson_id, term, translation)
SELECT l.id, v.term, v.translation FROM lessons l
JOIN languages lang ON lang.id = l.language_id
CROSS JOIN (VALUES
  ('Loaf', 'Bread'),
  ('Beverage', 'Drink'),
  ('Dairy', 'Milk product'),
  ('Curd', 'Soft cheese'),
  ('Orchard fruit', 'Apple'),
  ('Brew', 'Coffee or Tea')
) AS v(term, translation)
WHERE lang.code = 'en' AND l.title = 'Food & Drinks';

-- English quiz questions
INSERT INTO quiz_questions (lesson_id, prompt, correct_option, options)
SELECT l.id, q.prompt, q.correct_option, q.options::jsonb FROM lessons l
JOIN languages lang ON lang.id = l.language_id
CROSS JOIN (VALUES
  ('Colors', 'What does ''Crimson'' mean?', 'Deep Red', '["Deep Red","Sky Blue","Bright Green","Yellow"]'),
  ('Colors', 'What does ''Azure'' mean?', 'Sky Blue', '["Deep Red","Sky Blue","Black","White"]'),
  ('Colors', 'What does ''Emerald'' mean?', 'Bright Green', '["Yellow","Purple","Bright Green","Orange"]'),
  ('Colors', 'What does ''Golden'' mean?', 'Yellow', '["Yellow","Green","Blue","Red"]'),
  ('Colors', 'What does ''Ebony'' mean?', 'Black', '["White","Gray","Black","Brown"]'),
  ('Colors', 'What does ''Pearl'' mean?', 'White', '["Black","White","Yellow","Green"]'),
  ('Numbers', 'What does ''Eleven'' mean?', 'Eleven (11)', '["Eleven (11)","Twenty (20)","Thirty (30)","Fifty (50)"]'),
  ('Numbers', 'What does ''Twenty'' mean?', 'Twenty (20)', '["Eleven (11)","Twenty (20)","Fifty (50)","Hundred (100)"]'),
  ('Numbers', 'What does ''Thirty'' mean?', 'Thirty (30)', '["Twenty (20)","Thirty (30)","Fifty (50)","Thousand (1000)"]'),
  ('Numbers', 'What does ''Fifty'' mean?', 'Fifty (50)', '["Thirty (30)","Fifty (50)","Hundred (100)","Eleven (11)"]'),
  ('Numbers', 'What does ''Hundred'' mean?', 'One Hundred (100)', '["One Hundred (100)","One Thousand (1000)","Thirty (30)","Twenty (20)"]'),
  ('Numbers', 'What does ''Thousand'' mean?', 'One Thousand (1000)', '["One Hundred (100)","One Thousand (1000)","Fifty (50)","Thirty (30)"]'),
  ('Greetings', 'What does ''Good morning'' mean?', 'Morning greeting', '["Morning greeting","Evening greeting","Formal greeting","Farewell wish"]'),
  ('Greetings', 'What does ''Good evening'' mean?', 'Evening greeting', '["Morning greeting","Evening greeting","Polite interruption","Response to thanks"]'),
  ('Greetings', 'What does ''How do you do'' mean?', 'Formal greeting', '["Farewell wish","Formal greeting","Morning greeting","Polite interruption"]'),
  ('Greetings', 'What does ''Take care'' mean?', 'Farewell wish', '["Response to thanks","Farewell wish","Evening greeting","Formal greeting"]'),
  ('Greetings', 'What does ''You''re welcome'' mean?', 'Response to thanks', '["Polite interruption","Response to thanks","Morning greeting","Farewell wish"]'),
  ('Greetings', 'What does ''Excuse me'' mean?', 'Polite interruption', '["Polite interruption","Farewell wish","Evening greeting","Response to thanks"]'),
  ('Animals', 'What does ''Feline'' mean?', 'Cat', '["Cat","Dog","Bird","Fish"]'),
  ('Animals', 'What does ''Canine'' mean?', 'Dog', '["Cat","Dog","Horse","Lion"]'),
  ('Animals', 'What does ''Avian'' mean?', 'Bird', '["Fish","Bird","Cat","Dog"]'),
  ('Animals', 'What does ''Aquatic'' mean?', 'Fish', '["Fish","Bird","Horse","Lion"]'),
  ('Animals', 'What does ''Equine'' mean?', 'Horse', '["Cat","Dog","Bird","Horse"]'),
  ('Animals', 'What does ''Mane'' mean?', 'Lion''s hair', '["Fish","Horse","Lion''s hair","Bird"]'),
  ('Food & Drinks', 'What does ''Loaf'' mean?', 'Bread', '["Bread","Drink","Milk product","Soft cheese"]'),
  ('Food & Drinks', 'What does ''Beverage'' mean?', 'Drink', '["Bread","Drink","Apple","Coffee or Tea"]'),
  ('Food & Drinks', 'What does ''Dairy'' mean?', 'Milk product', '["Soft cheese","Milk product","Drink","Bread"]'),
  ('Food & Drinks', 'What does ''Curd'' mean?', 'Soft cheese', '["Soft cheese","Apple","Milk product","Coffee or Tea"]'),
  ('Food & Drinks', 'What does ''Orchard fruit'' mean?', 'Apple', '["Bread","Apple","Coffee or Tea","Drink"]'),
  ('Food & Drinks', 'What does ''Brew'' mean?', 'Coffee or Tea', '["Milk product","Coffee or Tea","Soft cheese","Apple"]')
) AS q(lesson_title, prompt, correct_option, options)
WHERE lang.code = 'en' AND l.title = q.lesson_title;

-- =====================
-- HINDI LESSONS (language_id = 7)
-- =====================
INSERT INTO lessons (language_id, title, "order")
SELECT id, 'Colors', 1 FROM languages WHERE code='hi'
ON CONFLICT DO NOTHING;
INSERT INTO lessons (language_id, title, "order")
SELECT id, 'Numbers', 2 FROM languages WHERE code='hi'
ON CONFLICT DO NOTHING;
INSERT INTO lessons (language_id, title, "order")
SELECT id, 'Greetings', 3 FROM languages WHERE code='hi'
ON CONFLICT DO NOTHING;
INSERT INTO lessons (language_id, title, "order")
SELECT id, 'Animals', 4 FROM languages WHERE code='hi'
ON CONFLICT DO NOTHING;
INSERT INTO lessons (language_id, title, "order")
SELECT id, 'Food & Drinks', 5 FROM languages WHERE code='hi'
ON CONFLICT DO NOTHING;

-- Hindi Colors vocab
INSERT INTO vocab_items (lesson_id, term, translation)
SELECT l.id, v.term, v.translation FROM lessons l
JOIN languages lang ON lang.id = l.language_id
CROSS JOIN (VALUES
  ('Laal (लाल)', 'Red'),
  ('Neela (नीला)', 'Blue'),
  ('Hara (हरा)', 'Green'),
  ('Peela (पीला)', 'Yellow'),
  ('Kaala (काला)', 'Black'),
  ('Safed (सफ़ेद)', 'White')
) AS v(term, translation)
WHERE lang.code = 'hi' AND l.title = 'Colors';

-- Hindi Numbers vocab
INSERT INTO vocab_items (lesson_id, term, translation)
SELECT l.id, v.term, v.translation FROM lessons l
JOIN languages lang ON lang.id = l.language_id
CROSS JOIN (VALUES
  ('Ek (एक)', 'One'),
  ('Do (दो)', 'Two'),
  ('Teen (तीन)', 'Three'),
  ('Chaar (चार)', 'Four'),
  ('Paanch (पाँच)', 'Five'),
  ('Chhah (छह)', 'Six')
) AS v(term, translation)
WHERE lang.code = 'hi' AND l.title = 'Numbers';

-- Hindi Greetings vocab
INSERT INTO vocab_items (lesson_id, term, translation)
SELECT l.id, v.term, v.translation FROM lessons l
JOIN languages lang ON lang.id = l.language_id
CROSS JOIN (VALUES
  ('Namaste (नमस्ते)', 'Hello'),
  ('Alvida (अलविदा)', 'Goodbye'),
  ('Dhanyavaad (धन्यवाद)', 'Thank you'),
  ('Kripaya (कृपया)', 'Please'),
  ('Haan (हाँ)', 'Yes'),
  ('Nahi (नहीं)', 'No')
) AS v(term, translation)
WHERE lang.code = 'hi' AND l.title = 'Greetings';

-- Hindi Animals vocab
INSERT INTO vocab_items (lesson_id, term, translation)
SELECT l.id, v.term, v.translation FROM lessons l
JOIN languages lang ON lang.id = l.language_id
CROSS JOIN (VALUES
  ('Billi (बिल्ली)', 'Cat'),
  ('Kutta (कुत्ता)', 'Dog'),
  ('Chidhiya (चिड़िया)', 'Bird'),
  ('Machhli (मछली)', 'Fish'),
  ('Ghoda (घोड़ा)', 'Horse'),
  ('Sher (शेर)', 'Lion')
) AS v(term, translation)
WHERE lang.code = 'hi' AND l.title = 'Animals';

-- Hindi Food vocab
INSERT INTO vocab_items (lesson_id, term, translation)
SELECT l.id, v.term, v.translation FROM lessons l
JOIN languages lang ON lang.id = l.language_id
CROSS JOIN (VALUES
  ('Roti (रोटी)', 'Bread'),
  ('Paani (पानी)', 'Water'),
  ('Doodh (दूध)', 'Milk'),
  ('Paneer (पनीर)', 'Cottage Cheese'),
  ('Seb (सेब)', 'Apple'),
  ('Chai (चाय)', 'Tea')
) AS v(term, translation)
WHERE lang.code = 'hi' AND l.title = 'Food & Drinks';

-- Hindi quiz questions
INSERT INTO quiz_questions (lesson_id, prompt, correct_option, options)
SELECT l.id, q.prompt, q.correct_option, q.options::jsonb FROM lessons l
JOIN languages lang ON lang.id = l.language_id
CROSS JOIN (VALUES
  ('Colors', 'What does ''Laal (लाल)'' mean?', 'Red', '["Red","Blue","Green","Yellow"]'),
  ('Colors', 'What does ''Neela (नीला)'' mean?', 'Blue', '["Red","Blue","Black","White"]'),
  ('Colors', 'What does ''Hara (हरा)'' mean?', 'Green', '["Yellow","Purple","Green","Orange"]'),
  ('Colors', 'What does ''Peela (पीला)'' mean?', 'Yellow', '["Yellow","Green","Blue","Red"]'),
  ('Colors', 'What does ''Kaala (काला)'' mean?', 'Black', '["White","Gray","Black","Brown"]'),
  ('Colors', 'What does ''Safed (सफ़ेद)'' mean?', 'White', '["Black","White","Yellow","Green"]'),
  ('Numbers', 'What does ''Ek (एक)'' mean?', 'One', '["One","Two","Three","Four"]'),
  ('Numbers', 'What does ''Do (दो)'' mean?', 'Two', '["One","Two","Five","Six"]'),
  ('Numbers', 'What does ''Teen (तीन)'' mean?', 'Three', '["Four","Three","Two","One"]'),
  ('Numbers', 'What does ''Chaar (चार)'' mean?', 'Four', '["Five","Six","Three","Four"]'),
  ('Numbers', 'What does ''Paanch (पाँच)'' mean?', 'Five', '["Four","Five","Six","Two"]'),
  ('Numbers', 'What does ''Chhah (छह)'' mean?', 'Six', '["Five","Six","One","Three"]'),
  ('Greetings', 'What does ''Namaste (नमस्ते)'' mean?', 'Hello', '["Hello","Goodbye","Please","Thank you"]'),
  ('Greetings', 'What does ''Alvida (अलविदा)'' mean?', 'Goodbye', '["Hello","Goodbye","Yes","No"]'),
  ('Greetings', 'What does ''Dhanyavaad (धन्यवाद)'' mean?', 'Thank you', '["Please","Thank you","Hello","Goodbye"]'),
  ('Greetings', 'What does ''Kripaya (कृपया)'' mean?', 'Please', '["Please","Thank you","Yes","No"]'),
  ('Greetings', 'What does ''Haan (हाँ)'' mean?', 'Yes', '["No","Yes","Hello","Goodbye"]'),
  ('Greetings', 'What does ''Nahi (नहीं)'' mean?', 'No', '["Yes","No","Please","Thank you"]'),
  ('Animals', 'What does ''Billi (बिल्ली)'' mean?', 'Cat', '["Cat","Dog","Bird","Fish"]'),
  ('Animals', 'What does ''Kutta (कुत्ता)'' mean?', 'Dog', '["Cat","Dog","Horse","Lion"]'),
  ('Animals', 'What does ''Chidhiya (चिड़िया)'' mean?', 'Bird', '["Fish","Bird","Cat","Dog"]'),
  ('Animals', 'What does ''Machhli (मछली)'' mean?', 'Fish', '["Fish","Bird","Horse","Lion"]'),
  ('Animals', 'What does ''Ghoda (घोड़ा)'' mean?', 'Horse', '["Cat","Dog","Bird","Horse"]'),
  ('Animals', 'What does ''Sher (शेर)'' mean?', 'Lion', '["Fish","Horse","Lion","Bird"]'),
  ('Food & Drinks', 'What does ''Roti (रोटी)'' mean?', 'Bread', '["Bread","Water","Milk","Cottage Cheese"]'),
  ('Food & Drinks', 'What does ''Paani (पानी)'' mean?', 'Water', '["Bread","Water","Apple","Tea"]'),
  ('Food & Drinks', 'What does ''Doodh (दूध)'' mean?', 'Milk', '["Cottage Cheese","Milk","Water","Bread"]'),
  ('Food & Drinks', 'What does ''Paneer (पनीर)'' mean?', 'Cottage Cheese', '["Cottage Cheese","Apple","Milk","Tea"]'),
  ('Food & Drinks', 'What does ''Seb (सेब)'' mean?', 'Apple', '["Bread","Apple","Tea","Water"]'),
  ('Food & Drinks', 'What does ''Chai (चाय)'' mean?', 'Tea', '["Milk","Tea","Cottage Cheese","Apple"]')
) AS q(lesson_title, prompt, correct_option, options)
WHERE lang.code = 'hi' AND l.title = q.lesson_title;
