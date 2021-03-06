﻿// элементарный глагол

// ------------------------------

//wordentry_set БытьГлагол = { глагол:быть{} }

patterns Гл0 export { ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД МОДАЛЬНЫЙ ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }

pattern Гл0
{
 глагол:*{} : export{ ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД МОДАЛЬНЫЙ ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }
}

// Грипп «закрыл» школы города
//       ^^^^^^^^
pattern Гл0
{
 q1=ОткрывающаяКавычка
 v=Гл0 : export{ ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД МОДАЛЬНЫЙ ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }
 q2=ЗакрывающаяКавычка
} : links
{
 v.{
    <PREPEND_QUOTE>q1
    <APPEND_QUOTE>q2
   }
}

// -------------------------------------------------------

patterns ГлСПрефиксом export{ ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД МОДАЛЬНЫЙ ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }

pattern ГлСПрефиксом
{
 Гл0 : export{ ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД МОДАЛЬНЫЙ ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }
}

// Грипп «закрыл» школы города
//       ^^^^^^^^
pattern ГлСПрефиксом
{
 q1=ОткрывающаяКавычка
 v=Гл0 : export{ ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД МОДАЛЬНЫЙ ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }
 q2=ЗакрывающаяКавычка
} : links
{
 v.{
    <PREPEND_QUOTE>q1
    <APPEND_QUOTE>q2
   }
}



// Появление родительной валентности у непереходного глагола
// в прошедшем времени в ср.роде ед.ч.:
// Однако этого не произошло.
//        ^^^^^^^^^^^^^^^^^^
pattern ГлСПрефиксом export { ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД (МОДАЛЬНЫЙ) ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }
{
 n=частица:не{}
 v=Гл0{ ~ПАДЕЖ:ВИН ВРЕМЯ:ПРОШЕДШЕЕ РОД:СР ЧИСЛО:ЕД } : export{ ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД ПЕРЕХОДНОСТЬ:ПЕРЕХОДНЫЙ ПАДЕЖ:РОД node:root_node }
}
: links { v.<NEGATION_PARTICLE>n }
: ngrams { -5 }

// Но этого и не требовалось.
//          ^^^^^^^^^^^^^^^^
pattern ГлСПрефиксом export { ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД (МОДАЛЬНЫЙ) ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }
{
 p0=частица:и{}
 n=частица:не{}
 v=Гл0{ ~ПАДЕЖ:ВИН ВРЕМЯ:ПРОШЕДШЕЕ РОД:СР ЧИСЛО:ЕД } : export{ ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД ПЕРЕХОДНОСТЬ:ПЕРЕХОДНЫЙ ПАДЕЖ:РОД node:root_node }
}
: links
{
 v.{
    <PREFIX_PARTICLE>p0
    <NEGATION_PARTICLE>n
   }
}
: ngrams { -5 }


// не произойдет ли аварии?
// ^^^^^^^^^^^^^^^^
pattern ГлСПрефиксом export { ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД (МОДАЛЬНЫЙ) ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }
{
 n=частица:не{}
 v=Гл0{ ~ПАДЕЖ:ВИН ~ВРЕМЯ:ПРОШЕДШЕЕ ЛИЦО:3 ЧИСЛО:ЕД } : export{ ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД ПЕРЕХОДНОСТЬ:ПЕРЕХОДНЫЙ ПАДЕЖ:РОД node:root_node }
}
: links { v.<NEGATION_PARTICLE>n }
: ngrams { -5 }




// Для глагола БЫТЬ частица НЕ порождает родительную валентность:
//
// - То есть объединения не будет?
//                       ^^^^^^^^
wordentry_set БытьДляРодВал = глагол:{ быть }
pattern ГлСПрефиксом export { ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД (МОДАЛЬНЫЙ) ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }
{
 n=частица:не{}
 v=Гл0{ БытьДляРодВал } : export{ ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД ПЕРЕХОДНОСТЬ:ПЕРЕХОДНЫЙ ПАДЕЖ:РОД node:root_node }
}
: links { v.<NEGATION_PARTICLE>n }
: ngrams { 1 }




// В качестве таких компонент как раз и выступают электромагнитные потенциалы
//                                    ^^^^^^^^^^^
pattern ГлСПрефиксом
{
 p=частица:и{}
 v=Гл0 : export{ ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД МОДАЛЬНЫЙ ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }
} : links { v.<PREFIX_PARTICLE>p }
  : ngrams { -1 }


// А это чего-нибудь да стоит.
//                   ^^^^^^^^
pattern ГлСПрефиксом
{
 p=частица:да{}
 v=Гл0 : export{ ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД МОДАЛЬНЫЙ ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }
} : links { v.<PREFIX_PARTICLE>p }
  : ngrams { -1 }


// Студенты  все  хихикали,  все перекликались у  Вари под окнами.
//           ^^^             ^^^
// Новости всё не появлялись
//         ^^^^^^^^^^^^^^^^^
pattern ГлСПрефиксом
{
 p=частица:все{}
 v=Гл0{ вид:несоверш } : export{ ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД МОДАЛЬНЫЙ ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }
} : links { v.<PREFIX_PARTICLE>p }
  : ngrams { -4 }


// куда бы ни уехал человек
//         ^^^^^^^^
pattern ГлСПрефиксом
{
 p=частица:ни{}
 v=Гл0 : export{ ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД МОДАЛЬНЫЙ ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }
} : links { v.<NEGATION_PARTICLE>p }

// Частица ВОТ перед глаголом - можно вообще игнорировать:
// я вот написал о них целую книгу
pattern ГлСПрефиксом
{
 p=частица:вот{}
 v=Гл0 : export{ ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД МОДАЛЬНЫЙ ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }
} : links { v.<PREFIX_PARTICLE>p }



// для непереходных глаголов частица НЕ ведет себя как обычная частица:
//
// не смеялся
pattern ГлСПрефиксом
{
 n=частица:не{}
 v=Гл0{ ~ПАДЕЖ:ВИН } : export{ ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД МОДАЛЬНЫЙ ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }
} : links { v.<NEGATION_PARTICLE>n }

// отрицание меняет падежную валентность глагола,
// вместо винительного падежа глагол присоединяет родительный:
//
// никакой утечки не вижу
// не видел ни одной кошки
pattern ГлСПрефиксом
{
 n=частица:не{}
 v=Гл0{ ПЕРЕХОДНОСТЬ:ПЕРЕХОДНЫЙ ПАДЕЖ:ВИН } : export { ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД ПЕРЕХОДНОСТЬ ПАДЕЖ МОДАЛЬНЫЙ @add(ПАДЕЖ:РОД) node:root_node }
} : links { v.<NEGATION_PARTICLE>n }


// За что русские предприниматели "не любят" Русскую общину Латвии.
//                                ^^^^^^^^^^
pattern ГлСПрефиксом
{
 q1=ОткрывающаяКавычка
 v=ГлСПрефиксом : export{ ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД МОДАЛЬНЫЙ ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }
 q2=ЗакрывающаяКавычка
} : links
{
 v.{
    <PREPEND_QUOTE>q1
    <APPEND_QUOTE>q2
   }
}


// Я даже и не открывал книги
//        ^^^^^^^^^^^^^
pattern ГлСПрефиксом
{
 x=частица:и{}
 n=частица:не{}
 v=Гл0 : export{ ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД МОДАЛЬНЫЙ ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }
} : links
{
 v.{
    <NEGATION_PARTICLE>n
    <PREFIX_PARTICLE>x
   }
}

// Студент так и не смог ответить на вопросы
//         ^^^^^^^^^^^^^
pattern ГлСПрефиксом
{
 x1=наречие:так{}
 x2=союз:и{}
 n=частица:не{}
 v=Гл0 : export{ ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД МОДАЛЬНЫЙ ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }
} : links
{
 v.{
    <NEGATION_PARTICLE>n.<ATTRIBUTE>x1.<NEXT_COLLOCATION_ITEM>x2
   }
}

patterns ПрефиксДляГлагола export { node:root_node }
pattern ПрефиксДляГлагола
{
 p=частица:ну{} : export { node:root_node }
}

// Вася, ну-ка стань сюда.
//       ^^^^^
pattern ПрефиксДляГлагола
{
 p=частица:ну{} : export { node:root_node }
 t='-'
 p2=частица:ка{}
} : links { p.<POSTFIX_PARTICLE>t.<NEXT_COLLOCATION_ITEM>p2 }

pattern ГлСПрефиксом
{
 p=ПрефиксДляГлагола
 v=Гл0 : export{ ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД МОДАЛЬНЫЙ ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }
} : links
{
 v.<PREFIX_PARTICLE>p
}


// Любые частицы прикрепляем к глаголу с большим штрафом
pattern ГлСПрефиксом
{
 n=частица:*{}
 v=Гл0 : export{ ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД МОДАЛЬНЫЙ ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }
}
: links { v.<PREFIX_PARTICLE>n }
: ngrams { -10 }


// -----------------------------------------------------------------

wordentry_set ГлагПостфикс0 = { частица:же{}, частица:ли{}, частица:бы{}, частица:б{} }

patterns ГлагПостфикс export { node:root_node  }

pattern ГлагПостфикс
{
 ГлагПостфикс0 : export { node:root_node  }
}

pattern ГлагПостфикс
{
 частица:*{} : export { node:root_node  }
} : ngrams { -10 }


// Пойдём-ка мы домой
//       ^^^
pattern ГлагПостфикс
{
 t='-' : export { node:root_node  }
 p=частица:ка{}
} : links { t.<NEXT_COLLOCATION_ITEM>p }

// Отчего умер-то?
//        ^^^^^^^
pattern ГлагПостфикс
{
 t='-' : export { node:root_node  }
 p=частица:то{}
}
: links { t.<NEXT_COLLOCATION_ITEM>p }

// --------------------------------------------------------

patterns ГлСПостфиксом export { ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД МОДАЛЬНЫЙ ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }

pattern ГлСПостфиксом
{
 ГлСПрефиксом : export { ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД МОДАЛЬНЫЙ ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }
}

pattern ГлСПостфиксом
{
 q1=ОткрывающаяКавычка
 v=ГлСПостфиксом : export{ ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД МОДАЛЬНЫЙ ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }
 q2=ЗакрывающаяКавычка
} : links
{
 v.{
    <PREPEND_QUOTE>q1
    <APPEND_QUOTE>q2
   }
}


pattern ГлСПостфиксом
{
 v=ГлСПрефиксом : export{ ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД МОДАЛЬНЫЙ ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }
 p=ГлагПостфикс
}
: links { v.<POSTFIX_PARTICLE>p }
: ngrams { 1 }



// -----------------------------------------------------------------


patterns Гл1 export { ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД МОДАЛЬНЫЙ ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }

pattern Гл1
{
 v=ГлСПостфиксом : export{ ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД МОДАЛЬНЫЙ ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }
}

// ты ищи-ищи!
//    ^^^^^^^
pattern Гл1
{
 v=глагол:*{} : export{ ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД МОДАЛЬНЫЙ ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }
 t='-'
 v2=глагол:*{ =v:НАКЛОНЕНИЕ =v:ВИД =v:ВРЕМЯ =v:ЛИЦО =v:ЧИСЛО }
} : links { v.<RIGHT_LOGIC_ITEM>t.<NEXT_COLLOCATION_ITEM>v2 }


// Дефолтное правило - разрешаем любым наречиям модифицировать глагол
pattern Гл1
{
 mod=наречие:*{}
 v=ГлСПостфиксом : export{ ВИД ВРЕМЯ ЛИЦО ЧИСЛО НАКЛОНЕНИЕ РОД МОДАЛЬНЫЙ ПЕРЕХОДНОСТЬ ПАДЕЖ node:root_node }
} : ngrams { -10 }

// -----------------------------------------------------------------------------
