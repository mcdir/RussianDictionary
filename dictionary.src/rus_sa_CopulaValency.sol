﻿
// Это мой карандаш
// Это наше дело
// Это царство жизни!
tree_scorer ВалентностьНульСвязки language=Russian generic
{
 if context { существительное:*{ ПАДЕЖ:ИМ 2 }.<SUBJECT>местоим_сущ:это{ падеж:им 1 } }
  then 10
}



// - А в чем дело? - обиделся исполнитель.
//     ^^^^^^^^^^
tree_scorer ВалентностьНульСвязки language=Russian
{
 if context { существительное:дело{ ПАДЕЖ:ИМ }.<PREPOS_ADJUNCT>предлог:в{}.*:*{ падеж:предл } }
  then 20
}


// Подавим деепричастия для нулевой связки:
// какая у нас скорость?
// ^^^^^
tree_scorer ВалентностьНульСвязки language=Russian generic
{
 if context { существительное:*{ ПАДЕЖ:ИМ }.деепричастие:*{} }
  then -10
}


// -----------------------------------------------------------

// у тебя впереди серьезное дело
// у меня важные вести
tree_scorer ВалентностьНульСвязки language=Russian generic
{
 if context { существительное:*{ 2 ПАДЕЖ:ИМ }.{ <PREPOS_ADJUNCT>предлог:у{1} <ATTRIBUTE>прилагательное:*{ ПАДЕЖ:ИМ } } }
  then 13
}

// У нас два пути
tree_scorer ВалентностьНульСвязки language=Russian generic
{
 if context { существительное:*{ 2 ПАДЕЖ:РОД }.{ <ATTRIBUTE>ЧИСЛИТЕЛЬНОЕ:*{ ПАДЕЖ:ИМ } <PREPOS_ADJUNCT>предлог:у{1} } }
  then 7
}

// У нас 2 пути
tree_scorer ВалентностьНульСвязки language=Russian generic
{
 if context { существительное:*{ 2 ПАДЕЖ:РОД }.{ <ATTRIBUTE>num_word:*{} <PREPOS_ADJUNCT>предлог:у{1} } }
  then 7
}


// у вас много работы
tree_scorer ВалентностьНульСвязки language=Russian generic
{
 if context { существительное:*{ ПАДЕЖ:РОД }.<ATTRIBUTE>НаречДляРод0 }
  then 7
}

/*
// А мы простой народ
tree_scorer ВалентностьНульСвязки language=Russian generic
{
 if context { существительное:*{ 2 ПАДЕЖ:ИМ }.существительное:*{ 1 ПАДЕЖ:ИМ } }
  then 7
}
*/

// -----------------------------------------------------------
