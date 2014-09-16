﻿// Словосочетания и синтаксические обороты, выступающие в роли обстоятельств.
//
// Мы будем работать быстрее, в три смены, ежедневно!
//                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


#define _запятая ','

// ---------------------------------------------------------


// Некоторые глаголы допускают модификацию наречиями-множителями:
// наши силы вдвое превосходят силы противника
//           ^^^^^^^^^^^^^^^^^
//
// Также некоторые другие наречия могут модифицировать глагол,
// но только в редких случаях, поэтому
// для простоты моделирования сделаем их отдельно
wordentry_set РедкМодифГлаг=наречие:{ только, даже, лишь, именно,
вдвое, втрое, вчетверо, впятеро, вшестеро, всемеро
 }

pattern Обст
{
 ГруппаНареч1{ РедкМодифГлаг } : export { node:root_node }
} : ngrams { -5 }





// ----------------------------------------------------

patterns ПостфиксМодифНареч export { node:root_node }

wordentry_set ПостфиксМодифНареч0=
{
 частица:уж{}, // Гулять под дождем не так уж романтично
 частица:же{}, // затем столь же рассеянно принялся жевать.
 частица:ли{}, // Так ли плохо мы отработали?
 частица:бы{},
 частица:б{}
}

// Как же быстро ты приехал
// ^^^^^^
pattern ПостфиксМодифНареч
{
 ПостфиксМодифНареч0 : export { node:root_node }
}


// Не так-то мерзко стало на душе.
//    ^^^^^^
pattern ПостфиксМодифНареч
{
 t='-' : export { node:root_node }
 p=частица:то{}
}
: links { t.<NEXT_COLLOCATION_ITEM>p }

// они прибыли не так уж и быстро
//             ^^^^^^^^^^^
pattern ПостфиксМодифНареч
{
 p=частица:уж{} : export { node:root_node }
 p2=частица:и{}
}
: links { p.<POSTFIX_PARTICLE>p2 }
: ngrams { 1 }



// они справились не так и хорошо
//                ^^^^^^^^
// Контрпример:
// Но так и должно быть.
//    ~~~~~~~~~~~~
pattern ПостфиксМодифНареч
{
 частица:и{} : export { node:root_node }
}
: ngrams { 1 }




// --------------------------------------------------

wordentry_set ПремодифНареч = {
                               наречие:уже{}, // она длилась уже так долго
                               наречие:почти{},
                               наречие:иногда{},
                               наречие:временами{},
                               наречие:сначала{},
                               наречие:затем{},
                               наречие:"в конце концов"{},
                               наречие:наконец{}
                              }

wordentry_set МодифНареч0 = {
наречие:буквально{}, // оно появилось буквально ниоткуда.
наречие:неестественно{}, // живые зеленые глаза смотрели неестественно печально
наречие:прямо{},
наречие:как-то{}, // пришел-то он как-то по-паучьи.
наречие:так{}, // так приятно сделать другу подарок
наречие:столь{}, // прошло столь много лет!
наречие:настолько{}, // В комнате отдыха было настолько темно
наречие:насколько{}, // Насколько просто купить оружие в Техасе?
наречие:вполне{},
наречие:по крайней мере{}, // по крайней мере так ему сказали
наречие:почти{},
наречие:чуть{}, // тонкие губы лесного стрелка чуть заметно дрогнули.
наречие:совсем{},
наречие:слишком{},
наречие:словно{}, // страх пришел словно извне.
наречие:неожиданно{}, // однако камень поднялся неожиданно легко.
наречие:просто{}, // мои колени чувствуют себя просто великолепно
наречие:хоть{}, // постарайтесь теперь поспать хоть немного
наречие:даже{}, // мне жаль тебя даже сейчас
наречие:абсолютно{}, // остальные выглядели абсолютно нормально.
наречие:относительно{}, // первый час прошел относительно тихо.
наречие:довольно{}, // довольно скоро донесся шум двигателей.
наречие:сравнительно{}, // писать начал сравнительно недавно.
наречие:действительно{}, // идти пришлось действительно недалеко.
наречие:невыносимо{}, // обед тянулся невыносимо долго.
наречие:бесконечно{}, // молчание тянулось бесконечно долго.
наречие:угрожающе{}, // стены проносились угрожающе близко.
наречие:совершенно{},
наречие:ничуть{},
наречие:очень{},
наречие:весьма{},
наречие:крайне{},
наречие:исключительно{},
наречие:достаточно{},
наречие:чрезвычайно{},
наречие:чертовски{},
наречие:максимально{},
наречие:более{},
наречие:менее{},
наречие:недопустимо{},
наречие:неприемлемо{},
наречие:невероятно{},
наречие:невозможно{},
наречие:невообразимо{},
наречие:фантастически{},
наречие:сногсшибательно{},
наречие:феерически{},
наречие:охуительно{},
наречие:уже{},
наречие:"все еще"{},
наречие:практически{},
наречие:юридически{},
наречие:логически{},
наречие:чересчур{},
наречие:физически{},
наречие:едва{},
наречие:немного{},
наречие:чуточку{},
наречие:только{},
наречие:еле{},
наречие:особенно{}, // вдруг свет вспыхнул особенно ярко.
наречие:ужасно{}, // вдруг стало ужасно тихо.
наречие:эстетически{}, // сделать это эстетически верно
наречие:непривычно{} // дверь за ними захлопнулась непривычно тихо.
}


pattern МодифНареч
{
 a=МодифНареч0 : export { node:root_node }
}


// мне становится все более тревожно
//                ^^^^^^^^^
pattern МодифНареч
{
 p=частица:всё{}
 a=БолееМенее : export { node:root_node }
}
: links { a.<PREFIX_PARTICLE>p }
: ngrams { 4 }



// затем столь же рассеянно принялся жевать.
//       ^^^^^^^^
pattern МодифНареч
{
 a=МодифНареч0 : export { node:root_node }
 p=ПостфиксМодифНареч
}
: links { a.<POSTFIX_PARTICLE>p }
: ngrams { 2 }


// все шло более или менее гладко.
//         ^^^^^^^^^^^^^^^
pattern МодифНареч
{
 a=наречие:более{} : export { node:root_node }
 conj=союз:или{}
 a2=наречие:менее{}
} : links { a.<RIGHT_LOGIC_ITEM>conj.<NEXT_COLLOCATION_ITEM>a2 }
: ngrams { 2 }


// +++++++++++++++++++++++++++++++++++++++++++++++++++++


pattern Нареч0
{
 наречие:*{} : export { СТЕПЕНЬ node:root_node }
}

// Слова на -О часто могут быть наречиями, в том числе написанными с опечатками:
// Я ошарашено посмотрел на нее.
//   ^^^^^^^^^
pattern Нареч0
{
 @regex("(.+)[\\@б]о") : export { СТЕПЕНЬ:АТРИБ node:root_node }
} : ngrams { -8 }

pattern Нареч0
{
 @regex("(.+)[\\@б]ее") : export { СТЕПЕНЬ:СРАВН node:root_node }
} : ngrams { -5 }

// ----------------------------------------------------------------

patterns Нареч1 export { СТЕПЕНЬ node:root_node }

pattern Нареч1
{
 Нареч0 : export { СТЕПЕНЬ node:root_node }
}

pattern Нареч1
{
 not=частица:не{}
 a=Нареч0 : export { СТЕПЕНЬ node:root_node }
} : links { a.<NEGATION_PARTICLE>not }
: ngrams { 1 }


// Фактически пропуск произвольных частиц-междометий с большим штрафом:
// Ой больно, отпусти!
// ^^^^^^^^^
pattern Нареч1
{
 p=частица:*{}
 a=Нареч0 : export { СТЕПЕНЬ node:root_node }
} : links { a.<PREFIX_PARTICLE>p }
: ngrams { -10 }



// это громоздкое и не очень-то  изящное  приспособление
//                  ^^^^^^^^^^^
pattern Нареч1
{
 not=частица:не{}
 a=Нареч0 : export { СТЕПЕНЬ node:root_node }
 t='-'
 p=частица:то{}
} : links
{
 a.{
    <NEGATION_PARTICLE>not
    <POSTFIX_PARTICLE>t.<NEXT_COLLOCATION_ITEM>p
   }
}
: ngrams { 2 }



// Не поэтому ли она так испугалась?
// ^^^^^^^^^^^^^
pattern Нареч1
{
 not=частица:не{}
 a=Нареч0 : export { СТЕПЕНЬ node:root_node }
 p=ЧастицаЛи
} : links
{
 a.{
    <NEGATION_PARTICLE>not
    <POSTFIX_PARTICLE>p
   }
}
: ngrams { 1 }


// ну очень крутые ребята
// ^^^^^^^^
pattern Нареч1
{
 not=частица:ну{}
 a=Нареч0 : export { СТЕПЕНЬ node:root_node }
} : links { a.<PREFIX_PARTICLE>not }



// Она сильно-сильно зажмурилась.
//     ^^^^^^^^^^^^^
pattern Нареч1
{
 a=Нареч0 : export { СТЕПЕНЬ node:root_node }
 t='-'
 a2=Нареч0
}
: links { a.<RIGHT_LOGIC_ITEM>t.<NEXT_COLLOCATION_ITEM>a2 }



// скоро ли эта лестница кончится?
// ^^^^^^^^
pattern Нареч1
{
 a=Нареч0 : export { СТЕПЕНЬ node:root_node }
 p=частица:ли{}
} : links { a.<POSTFIX_PARTICLE>p }
: ngrams { 1 }


// Теперь-то вы мне верите?
// ^^^^^^^^^
pattern Нареч1
{
 a=Нареч0 : export { СТЕПЕНЬ node:root_node }
 t='-'
 p=частица:то{}
} : links { a.<POSTFIX_PARTICLE>t.<NEXT_COLLOCATION_ITEM>p }
: ngrams { 1 }


// только вот милиции боялась
// ^^^^^^^^^^
pattern Нареч1
{
 a=Нареч0 : export { СТЕПЕНЬ node:root_node }
 p=частица:вот{}
} : links { a.<POSTFIX_PARTICLE>p }
  : ngrams { -1 }


// зачем же повторять старые ошибки?
// ^^^^^^^^
pattern Нареч1
{
 a=Нареч0 : export { СТЕПЕНЬ node:root_node }
 p=ЧастицаЖеУж
} : links { a.<POSTFIX_PARTICLE>p }
  : ngrams { 1 }


// стены словно бы растворились
//       ^^^^^^^^^
// куда б тебе спрятаться?
// ^^^^^^
pattern Нареч1
{
 a=Нареч0 : export { СТЕПЕНЬ node:root_node }
 p=ЧастицаБы
} : links { a.<POSTFIX_PARTICLE>p }


// Но всё может происходить и по-другому
//                          ^^^^^^^^^^^^
pattern Нареч1
{
 p=частица:и{}
 a=Нареч0 : export { СТЕПЕНЬ node:root_node }
} : links { a.<PREFIX_PARTICLE>p }
  : ngrams { -4 }



wordentry_set НаречиеКвантификатор=наречие:{ лишь, только, "только лишь" }

// Люди хотят верить лишь время от времени
//                   ^^^^^^^^^^^^^^^^^^^^^
pattern Нареч1
{
 mod=НаречиеКвантификатор
 a=Нареч0 : export { СТЕПЕНЬ:АТРИБ node:root_node }
}
: links { a.<ATTRIBUTE>mod }
: ngrams { -2 }




// Разрешим связь ЛЮБЫХ наречий с большим штрафом
pattern Нареч1
{
 mod=наречие:*{ ~НаречиеКвантификатор }
 a=Нареч0 : export { СТЕПЕНЬ:АТРИБ node:root_node }
}
: links { a.<ATTRIBUTE>mod }
: ngrams { -11 }


// ----------------------------------------------------------------

pattern ГруппаНареч1
{
 Нареч1{СТЕПЕНЬ:АТРИБ} : export { node:root_node }
}

// очень даже может быть!
pattern ГруппаНареч1
{
 mod=наречие:очень{}
 a=наречие:даже{} : export { node:root_node }
} : links { a.<ATTRIBUTE>mod }


tree_scorers ВалентностьНаречия

wordentry_set НемодифНареч = { наречие:уж{}, наречие:как{} }

// очень точно
pattern ГруппаНареч1
{
 mod=МодифНареч
 a=Нареч1{СТЕПЕНЬ:АТРИБ ~НемодифНареч } : export { node:root_node }
}
: links { a.<ATTRIBUTE>mod }
: ngrams
{
 1
 adv_adv_score( mod, a )
 ВалентностьНаречия(a)
}




// голоса раздавались совсем уже близко
//                    ^^^^^^^^^^^^^^^^^
pattern ГруппаНареч1
{
 mod=наречие:совсем{}
 mod2=наречие:уже{}
 a=Нареч1{СТЕПЕНЬ:АТРИБ ~НемодифНареч } : export { node:root_node }
}
: links { a.<ATTRIBUTE>mod.<ATTRIBUTE>mod2 }
: ngrams
{
 2
 ВалентностьНаречия(a)
}

// вышло очень даже нехорошо
//       ^^^^^^^^^^^^^^^^^^^
pattern ГруппаНареч1
{
 mod=наречие:очень{}
 mod2=наречие:даже{}
 a=Нареч1{СТЕПЕНЬ:АТРИБ ~НемодифНареч } : export { node:root_node }
}
: links { a.<ATTRIBUTE>mod.<ATTRIBUTE>mod2 }
: ngrams
{
 1
 ВалентностьНаречия(a)
}


// вот только где искать девушку?
// ^^^^^^^^^^^^^^
pattern ГруппаНареч1
{
 p=частица:вот{}
 mod=МодифНареч
 a=Нареч1{СТЕПЕНЬ:АТРИБ ~НемодифНареч } : export { node:root_node }
}
: links { a.<ATTRIBUTE>mod.<PREFIX_PARTICLE>p }
: ngrams
{
 1
 adv_adv_score( mod, a )
 ВалентностьНаречия(a)
}


// еще недавно профессор был красив.
// ^^^^^^^^^^^
pattern ГруппаНареч1
{
 mod=наречие:еще{}
 a=Нареч1{СТЕПЕНЬ:АТРИБ} : export { node:root_node }
}
: links { a.<ATTRIBUTE>mod }
: ngrams
{
 -2
 adv_adv_score( mod, a )
 ВалентностьНаречия(a)
}



// иногда очень точно
pattern ГруппаНареч1
{
 mod1=ПремодифНареч
 mod2=МодифНареч
 a=Нареч1{СТЕПЕНЬ:АТРИБ} : export { node:root_node }
}
: links { a.<ATTRIBUTE>mod2.<ATTRIBUTE>mod1 }
: ngrams
{
 1
 ВалентностьНаречия(a)
}


// хозяин уже совсем скоро возвращается
//        ^^^^^^^^^^^^^^^^
pattern ГруппаНареч1
{
 mod1=наречие:уже{}
 mod2=наречие:совсем{}
 a=Нареч1{СТЕПЕНЬ:АТРИБ} : export { node:root_node }
}
: links { a.<ATTRIBUTE>mod2.<ATTRIBUTE>mod1 }
: ngrams
{
 2
 ВалентностьНаречия(a)
}




// действовать еще более отчаянно
//             ^^^^^^^^^^^^^^^^^^
pattern ГруппаНареч1
{
 mod1=МодифБолееМенее
 mod2=БолееМенее
 a=Нареч1{СТЕПЕНЬ:АТРИБ} : export { node:root_node }
}
: links { a.<ATTRIBUTE>mod2.<ATTRIBUTE>mod1 }
: ngrams
{
 2
 ВалентностьНаречия(a)
}



// очень не точно
pattern ГруппаНареч1
{
 mod=МодифНареч
 not=частица:не{}
 a=Нареч1{СТЕПЕНЬ:АТРИБ} : export { node:root_node }
}
: links { a.{
             <ATTRIBUTE>mod
             <NEGATION_PARTICLE>not
            } }
: ngrams
{
 1
 ВалентностьНаречия(a)
}


// Лишить фальшивых степеней кандидатов наук "совсем не сложно".
//                                           ^^^^^^^^^^^^^^^^^^
pattern ГруппаНареч1
{
 q1=ОткрывающаяКавычка
 x=ГруппаНареч1 : export { node:root_node }
 q2=ЗакрывающаяКавычка
} : links
{
 x.{
    <PREPEND_QUOTE>q1
    <APPEND_QUOTE>q2
   }
}


// не очень точно
pattern ГруппаНареч1
{
 not=частица:не{}
 mod=МодифНареч
 a=Нареч1{СТЕПЕНЬ:АТРИБ} : export { node:root_node }
}
: links { a.<ATTRIBUTE>mod.<NEGATION_PARTICLE>not }
: ngrams
{
 1
 ВалентностьНаречия(a)
}


// иногда не очень точно
pattern ГруппаНареч1
{
 mod1=ПремодифНареч
 not=частица:не{}
 mod2=МодифНареч
 a=Нареч1{СТЕПЕНЬ:АТРИБ} : export { node:root_node }
} : links {
           a.<ATTRIBUTE>mod2.{
                                   <NEGATION_PARTICLE>not
                                   <ATTRIBUTE>mod1
                                  }
          }
: ngrams
{
 1
 ВалентностьНаречия(a)
}


// иногда очень не точно
pattern ГруппаНареч1
{
 mod1=ПремодифНареч
 mod2=МодифНареч
 not=частица:не{}
 a=Нареч1{СТЕПЕНЬ:АТРИБ} : export { node:root_node }
} : links { a.{
               <NEGATION_PARTICLE>not
               <ATTRIBUTE>mod2.<ATTRIBUTE>mod1
              } }
: ngrams
{
 1
 ВалентностьНаречия(a)
}


wordentry_set DateAdverb1 =
{
 наречие:сегодня{},
 наречие:завтра{},
 наречие:вчера{},
 наречие:позавчера{},
 наречие:послезавтра{}
}

// наречия для обозначения части суток
wordentry_set DateAdverb2 =
{
 наречие:утром{},
 наречие:вечером{},
 наречие:днем{},
 наречие:ночью{}
}

// сегодня вечером
// можно это устроить сегодня же вечером?
pattern ГруппаНареч1
{
 a1=DateAdverb1 : export { node:root_node }
 p=@optional(частица:же{})
 a2=DateAdverb2
} : links
{
 a1.{
     <NEXT_COLLOCATION_ITEM>a2
     ~<POSTFIX_PARTICLE>p
    }
}

collocation_set НаречныеСловосочетания=
{
 "сразу же"
}

pattern ГруппаНареч1
{
 a="весь"{ падеж:вин }
 n="день"{ class:существительное падеж:вин } : export { node:root_node }
} : links { n.<ATTRIBUTE>a }


pattern ГруппаНареч1
{
 НаречныеСловосочетания : export { node:root_node }
}


// Связывание пар наречий МОДИФИКАТОР+НАРЕЧИЕ, в которых
// первое наречие обычно не является полноценным модификатором в общем случае:
//
// двигались они мучительно медленно.
//               ^^^^^^^^^^^^^^^^^^^
pattern ГруппаНареч1
{
 mod=Нареч0{ СТЕПЕНЬ:АТРИБ }
 a=Нареч1{ СТЕПЕНЬ:АТРИБ adv_adv_colloc(mod,_) } : export { node:root_node }
}
: links { a.<ATTRIBUTE>mod }
: ngrams
{
 -2
 adv_adv_score( mod, a )
 ВалентностьНаречия(a)
}


// -----------------------------------------------------

pattern ГруппаНареч2
{
 ГруппаНареч1 : export { node:root_node }
}



/*
// Даже улыбался он как-то сладко, аппетитно.
//                         ^^^^^^^^^^^^^^^^^
pattern ГруппаНареч2
{
 a1=ГруппаНареч1 : export { node:root_node }
 comma=','
 a2=ГруппаНареч1
}
: links { a1.<RIGHT_LOGIC_ITEM>comma.<NEXT_COLLOCATION_ITEM>a2 }
: ngrams { -1 }




// стрелял быстро, но достаточно точно
pattern ГруппаНареч2
{
 a1=ГруппаНареч1 : export { node:root_node }
 comma=_запятая
 conj=союз:но{}
 a2=ГруппаНареч1
} : links { a1.<RIGHT_LOGIC_ITEM>comma.
               <NEXT_COLLOCATION_ITEM>conj.
               <NEXT_COLLOCATION_ITEM>a2 }


// аппарат летел иногда быстро, временами медленно
pattern ГруппаНареч2
{
 mod1=ПремодифНареч
 a1=ГруппаНареч1 : export { node:root_node }
 comma=_запятая
 mod2=ПремодифНареч
 a2=ГруппаНареч1
} : links {
           a1.{
               <ATTRIBUTE>mod1
               <RIGHT_LOGIC_ITEM>comma.
                <NEXT_COLLOCATION_ITEM>a2.
                 <ATTRIBUTE>mod2
              }
          }

// иногда быстро, но временами медленно
pattern ГруппаНареч2
{
 mod1=ПремодифНареч
 a1=ГруппаНареч1 : export { node:root_node }
 comma=_запятая
 conj=союз:но{}
 mod2=ПремодифНареч
 a2=ГруппаНареч1
} : links {
           a1.{
               <ATTRIBUTE>mod1
               <RIGHT_LOGIC_ITEM>comma.
                <NEXT_COLLOCATION_ITEM>conj.
                 <NEXT_COLLOCATION_ITEM>a2.
                  <ATTRIBUTE>mod2
              }
          }

// иногда быстро, а временами медленно
pattern ГруппаНареч2
{
 mod1=ПремодифНареч
 a1=ГруппаНареч1 : export { node:root_node }
 comma=_запятая
 conj=союз:а{}
 mod2=ПремодифНареч
 a2=ГруппаНареч1
} : links {
           a1.{
               <ATTRIBUTE>mod1
               <RIGHT_LOGIC_ITEM>comma.
                <NEXT_COLLOCATION_ITEM>conj.
                 <NEXT_COLLOCATION_ITEM>a2.
                  <ATTRIBUTE>mod2
              }
          }

// работает не только быстро, но и чрезвычайно точно
pattern ГруппаНареч2
{
 not=частица:не{}
 mod1=наречие:только{}
 a1=ГруппаНареч1 : export { node:root_node }
 comma=_запятая
 conj1=союз:но{}
 conj2=союз:и{}
 a2=ГруппаНареч1
} : links {
           a1.{
               <ATTRIBUTE>mod1.<NEGATION_PARTICLE>not
               <RIGHT_LOGIC_ITEM>comma.
                <NEXT_COLLOCATION_ITEM>conj1.
                 <NEXT_COLLOCATION_ITEM>conj2.
                  <NEXT_COLLOCATION_ITEM>a2
              }
          }



// Кошки ели мой корм сначала быстро, затем медленно, наконец неторопливо
pattern ГруппаНареч2
{
 mod1=ПремодифНареч
 a1=ГруппаНареч1 : export { node:root_node }
 comma1=_запятая
 mod2=ПремодифНареч
 a2=ГруппаНареч1
 comma2=_запятая
 conj=@optional(союз:и{})
 mod3=ПремодифНареч
 a3=ГруппаНареч1
} : links {
           a1.{
               <ATTRIBUTE>mod1
               <RIGHT_LOGIC_ITEM>comma1.
                <NEXT_COLLOCATION_ITEM>a2.{
                                           <ATTRIBUTE>mod2
                                           <RIGHT_LOGIC_ITEM>comma2.{
                                                                     ~<NEXT_COLLOCATION_ITEM>conj
                                                                     <NEXT_COLLOCATION_ITEM>a3.
                                                                      <ATTRIBUTE>mod3
                                                                    }
                                          }
                   
              }
          }



// работаем ни быстро, ни медленно, ни потихоньку
pattern ГруппаНареч2
{
 conj1=союз:ни{}
 a1=ГруппаНареч1 : export { node:root_node }
 comma1=','
 conj2=союз:ни{}
 a2=ГруппаНареч1
 comma2=','
 conj3=союз:ни{}
 a3=ГруппаНареч1
} : links {
           a1.{
               <PREFIX_CONJUNCTION>conj1
               <RIGHT_LOGIC_ITEM>comma1.
                <NEXT_COLLOCATION_ITEM>conj2.
                 <NEXT_COLLOCATION_ITEM>a2.
                  <RIGHT_LOGIC_ITEM>comma2.
                   <NEXT_COLLOCATION_ITEM>conj3.
                    <NEXT_COLLOCATION_ITEM>a3
              }
          }


// работаем быстро, точно, да и аккуратно
pattern ГруппаНареч2
{
 a1=ГруппаНареч1 : export { node:root_node }
 comma1=_запятая
 a2=ГруппаНареч1
 comma2=_запятая
 conj1=союз:да{}
 conj2=союз:и{}
 a3=ГруппаНареч1
} : links {
           a1.<RIGHT_LOGIC_ITEM>comma1.
               <NEXT_COLLOCATION_ITEM>a2.
                <RIGHT_LOGIC_ITEM>comma2.
                 <NEXT_COLLOCATION_ITEM>conj1.
                  <NEXT_COLLOCATION_ITEM>conj2.
                   <NEXT_COLLOCATION_ITEM>a3
          }

// кошки ели мой корм либо быстро, либо очень быстро
pattern ГруппаНареч2
{
 conj1=союз:либо{}
 a1=ГруппаНареч1 : export { node:root_node }
 comma=_запятая
 conj2=союз:либо{}
 a2=ГруппаНареч1
} : links {
           a1.{
               <PREFIX_CONJUNCTION>conj1
               <RIGHT_LOGIC_ITEM>comma.
                <NEXT_COLLOCATION_ITEM>conj2.
                 <NEXT_COLLOCATION_ITEM>a2
              }
          }

// кошки обычно ели быстро, или неторопливо, или лениво
pattern ГруппаНареч2
{
 a1=ГруппаНареч1 : export { node:root_node }
 comma1=_запятая
 conj1=союз:или{}
 a2=ГруппаНареч1
 comma2=_запятая
 conj2=союз:или{}
 conj3=@optional(союз:даже{})
 a3=ГруппаНареч1
} : links {
           a1.<RIGHT_LOGIC_ITEM>comma1.
               <NEXT_COLLOCATION_ITEM>conj1.
                <NEXT_COLLOCATION_ITEM>a2.
                 <RIGHT_LOGIC_ITEM>comma2.
                  <NEXT_COLLOCATION_ITEM>conj2.{
                                                ~<NEXT_COLLOCATION_ITEM>conj3
                                                <NEXT_COLLOCATION_ITEM>a3
                                               }
          }

wordentry_set ИногдаВременами = { наречие:иногда{}, наречие:временами{} }

// кошки обычно ели мой корм быстро, иногда неторопливо, иногда лениво
pattern ГруппаНареч2
{
 a1=ГруппаНареч1 : export { node:root_node }
 comma1=_запятая
 mod2=ИногдаВременами
 a2=ГруппаНареч1
 comma2=_запятая
 conj2=@optional(@or(союз:а{},союз:но{}))
 mod3=ИногдаВременами
 conj3=@optional(союз:и{})
 a3=ГруппаНареч1
} : links
{
 a1.<RIGHT_LOGIC_ITEM>comma1.
     <NEXT_COLLOCATION_ITEM>a2.{
                                <ATTRIBUTE>mod2
                                <RIGHT_LOGIC_ITEM>comma2.{
                                                         ~<NEXT_COLLOCATION_ITEM>conj2
                                                         <RIGHT_LOGIC_ITEM>a3.{
                                                                               <ATTRIBUTE>mod3
                                                                               ~<NEXT_COLLOCATION_ITEM>conj3
                                                                              }
                                                         }
                               }
}

// кошки ели мой корм иногда быстро, иногда неторопливо, иногда лениво
pattern ГруппаНареч2
{
 mod1=ИногдаВременами
 a1=ГруппаНареч1 : export { node:root_node }
 comma1=_запятая
 mod2=ИногдаВременами
 a2=ГруппаНареч1
 comma2=_запятая
 conj1=@optional(ПротивитСоюз)
 conj2=@optional(союз:и{})
 mod3=ИногдаВременами
 a3=ГруппаНареч1
} : links
{
 a1.{
     <ATTRIBUTE>mod1
     <RIGHT_LOGIC_ITEM>comma1.
      <NEXT_COLLOCATION_ITEM>a2.{
                                 <ATTRIBUTE>mod2
                                 <RIGHT_LOGIC_ITEM>comma2.{
                                                           ~<NEXT_COLLOCATION_ITEM>conj1
                                                           ~<NEXT_COLLOCATION_ITEM>conj2
                                                           <NEXT_COLLOCATION_ITEM>a3.<ATTRIBUTE>mod3
                                                          }
                                }
    }
}

// кошки ели мой корм очень быстро, или неторопливо, или очень тщательно
pattern ГруппаНареч2
{
 a1=ГруппаНареч1 : export { node:root_node }
 comma1=_запятая
 conj1=союз:или{}
 a2=ГруппаНареч1
 comma2=_запятая
 conj2=союз:или{}
 conj3=@optional(союз:даже{})
 a3=ГруппаНареч1
} : links
{
 a1.<RIGHT_LOGIC_ITEM>comma1.
     <NEXT_COLLOCATION_ITEM>conj1.
      <NEXT_COLLOCATION_ITEM>a2.
       <RIGHT_LOGIC_ITEM>comma2.
        <NEXT_COLLOCATION_ITEM>conj2.{
                                      ~<NEXT_COLLOCATION_ITEM>conj3
                                      <NEXT_COLLOCATION_ITEM>a3
                                     }
}

// кошки ели мой корм либо быстро, либо неторопливо, либо очень лениво
pattern ГруппаНареч2
{
 conj1=союз:либо{}
 a1=ГруппаНареч1 : export { node:root_node }
 comma1=_запятая
 conj2=союз:либо{}
 a2=ГруппаНареч1
 comma2=_запятая
 conj3=союз:либо{}
 conj4=@optional(союз:даже{})
 a3=ГруппаНареч1
} : links
{
 a1.{
     <NEXT_COLLOCATION_ITEM>conj1
     <RIGHT_LOGIC_ITEM>comma1.
      <NEXT_COLLOCATION_ITEM>conj2.
       <NEXT_COLLOCATION_ITEM>a2.
        <RIGHT_LOGIC_ITEM>comma2.
         <NEXT_COLLOCATION_ITEM>conj3.{
                                       ~<NEXT_COLLOCATION_ITEM>conj4
                                       <NEXT_COLLOCATION_ITEM>a3
                                      }
    }
}

// и быстро, и точно, и аккуратно
pattern ГруппаНареч2
{
 conj1=союз:и{}
 a1=ГруппаНареч1 : export { node:root_node }
 comma1=_запятая
 conj2=союз:и{}
 a2=ГруппаНареч1
 comma2=_запятая
 conj3=союз:и{}
 a3=ГруппаНареч1
} : links
{
 a1.{
     <NEXT_COLLOCATION_ITEM>conj1
     <RIGHT_LOGIC_ITEM>comma1.
      <NEXT_COLLOCATION_ITEM>conj2.
       <NEXT_COLLOCATION_ITEM>a2.
        <RIGHT_LOGIC_ITEM>comma2.
         <NEXT_COLLOCATION_ITEM>conj3.
          <NEXT_COLLOCATION_ITEM>a3
    }
}

// то быстро, то медленно, то потихоньку
pattern ГруппаНареч2
{
 conj1=союз:то{}
 a1=ГруппаНареч1 : export { node:root_node }
 comma1=_запятая
 conj2=союз:то{}
 a2=ГруппаНареч1
 comma2=_запятая
 conj3=союз:то{}
 a3=ГруппаНареч1
} : links
{
 a1.{
     <NEXT_COLLOCATION_ITEM>conj1
     <RIGHT_LOGIC_ITEM>comma1.
      <NEXT_COLLOCATION_ITEM>conj2.
       <NEXT_COLLOCATION_ITEM>a2.
        <RIGHT_LOGIC_ITEM>comma2.
         <NEXT_COLLOCATION_ITEM>conj3.
          <NEXT_COLLOCATION_ITEM>a3
    }
}

// или быстро, или медленно, или потихоньку
pattern ГруппаНареч2
{
 conj1=союз:или{}
 a1=ГруппаНареч1 : export { node:root_node }
 comma1=_запятая
 conj2=союз:или{}
 a2=ГруппаНареч1
 comma2=_запятая
 conj3=союз:или{}
 a3=ГруппаНареч1
} : links
{
 a1.{
     <NEXT_COLLOCATION_ITEM>conj1
     <RIGHT_LOGIC_ITEM>comma1.
      <NEXT_COLLOCATION_ITEM>conj2.
       <NEXT_COLLOCATION_ITEM>a2.
        <RIGHT_LOGIC_ITEM>comma2.
         <NEXT_COLLOCATION_ITEM>conj3.
          <NEXT_COLLOCATION_ITEM>a3
    }
}

*/



// --------------------------------------------------------------------------------------



wordentry_set АтрибДляГода=прилагательное:{ этот, прошлый, текущий, будущий }
pattern ГруппаНареч2
{
 w1='в' : export { node:root_node }
 w2=АтрибДляГода{ падеж:предл род:муж число:ед }
 w3='году'{ падеж:мест }
}
: links
{
 w1.<OBJECT>w3.<ATTRIBUTE>w2
}
: ngrams
{
 1
 adj_noun_score(w2,w3)
}


// Наречный паттерн из слова ВСЁ и сравнительной степени наречия:
// Я всё больше убеждаюсь, что он меня обманывает.
//   ^^^^^^^^^^
// Банкиры всё чаще подают на должников в суд
//         ^^^^^^^^
pattern ГруппаНареч2
{
 p=частица:всё{}
 a=Нареч0{ степень:сравн } : export { node:root_node }
} : links { a.<PREFIX_PARTICLE>p }
  : ngrams { 3 }






/*
// громоздиться друг на друга
//              ^^^^^^^^^^^^^
pattern ГруппаНареч2
{
 n1='друг'{падеж:им}
 p=предлог:на{} : export { node:root_node }
 n2='друга'{падеж:вин}
} : links
{
 p.{
    <OBJECT>n1
    <OBJECT>n2
   }
}
: ngrams { 1 }
*/


// Дождь промочил его сверху донизу.
//                    ^^^^^^^^^^^^^
pattern ГруппаНареч1
{
 a1=наречие:сверху{} : export { node:root_node }
 a2=наречие:донизу{}
} : links { a1.<NEXT_COLLOCATION_ITEM>a2 }


// ----------------------------- 
// перечисление с обобщением
// ----------------------------- 

// Вверху, внизу - всюду пели жаворонки
pattern ГруппаНареч2
{
 a1=ГруппаНареч1 : export { node:root_node }
 comma=_запятая
 a2=ГруппаНареч1
 tiret='-'
 a3=ГруппаНареч1
} : links
{
 a1.
  <RIGHT_LOGIC_ITEM>comma.
   <NEXT_COLLOCATION_ITEM>a2.
    <RIGHT_LOGIC_ITEM>tiret.
     <NEXT_COLLOCATION_ITEM>a3
}


// --------------------------------------------------------------------


 // точнее
 pattern ГруппаСрНареч1
 {
  Нареч1{СТЕПЕНЬ:СРАВН} : export { node:root_node }
 }

/*
 // Раньше-то они могли касаться только сферы строительства.
 // ^^^^^^^^^
 pattern ГруппаСрНареч1
 {
  adv=Нареч0{СТЕПЕНЬ:СРАВН} : export { node:root_node }
  t='-'
  p=частица:то{}
  } : links { adv.<POSTFIX_PARTICLE>t.<NEXT_COLLOCATION_ITEM>p }

 // И возвращайся не позже утра.
 //               ^^^^^^^^
 pattern ГруппаСрНареч1
 {
  n=частица:не{}
  adv=Нареч0{СТЕПЕНЬ:СРАВН} : export { node:root_node }
 } : links { adv.<NEGATION_PARTICLE>n }

 // скорее бы скрыться от этих голосов!
 pattern ГруппаСрНареч1
 {
  a=Нареч0{СТЕПЕНЬ:СРАВН} : export { node:root_node }
  p=ЧастицаБы
 } : links { a.<POSTFIX_PARTICLE>p }
   : ngrams { 1 }

 // раньше же ты справлялся!
 pattern ГруппаСрНареч1
 {
  a=Нареч0{СТЕПЕНЬ:СРАВН} : export { node:root_node }
  p=частица:же{}
 } : links { a.<POSTFIX_PARTICLE>p }
   : ngrams { 1 }
*/

 // слегка быстрее
 pattern ГруппаСрНареч1
 {
  mod=МодифСравнНареч
  a=Нареч1{СТЕПЕНЬ:СРАВН} : export { node:root_node }
 }
 : links { a.<ATTRIBUTE>mod }
 : ngrams { 1 }


 // Тем сильнее он ненавидел зиму
 // ^^^^^^^^^^^
 pattern ГруппаСрНареч1
 {
  mod=частица:тем{}
  a=Нареч1{СТЕПЕНЬ:СРАВН} : export { node:root_node }
 }
 : links { a.<PREFIX_PARTICLE>mod }
 : ngrams { 1 }


 wordentry_set ПремодифСравнНареч=наречие:{ уже, лишь, 'только лишь' }

 // вторая пошла уже значительно лучше
 //              ^^^^^^^^^^^^^^^^^^^^^
 pattern ГруппаСрНареч1
 {
  mod=ПремодифСравнНареч
  mod2=МодифСравнНареч
  a=Нареч1{СТЕПЕНЬ:СРАВН} : export { node:root_node }
 } : links { a.<ATTRIBUTE>mod2.<ATTRIBUTE>mod }
   : ngrams { 1 }



 // а результаты могли быть куда хуже
 //                         ^^^^^^^^^
 pattern ГруппаСрНареч1
 {
  mod=наречие:куда{}
  a=Нареч1{СТЕПЕНЬ:СРАВН} : export { node:root_node }
 } : links { a.<ATTRIBUTE>mod }
   : ngrams { -1 }

 // эти города были построены немного ниже уровня мирового океана
 pattern ГруппаСрНареч1
 {
  mod=МодифСравнНареч
  a=Нареч1{СТЕПЕНЬ:СРАВН} : export { node:root_node }
  n=ГруппаСущ4{ПАДЕЖ:РОД}
 } : links { a.{
                <ATTRIBUTE>mod
                <RIGHT_COMPARISON_Y>n
               } }
   : ngrams { 1 }

 // Кошки ели мой корм быстрее, чем то существо
 pattern ГруппаСрНареч1
 {
  a=Нареч1{СТЕПЕНЬ:СРАВН} : export { node:root_node }
  comma=_запятая
  conj=союз:чем{}
  n=ГруппаСущ4{ПАДЕЖ:ИМ}
 } : links {
            a.
             <RIGHT_COMPARISON_Y>comma.
              <NEXT_COLLOCATION_ITEM>conj.
               <NEXT_COLLOCATION_ITEM>n
           }


// ----------------------------------------------------


// делать движения в такт музыке
pattern ОбстФраза0
{
 p=предлог:в{} : export { node:root_node }
 n1=существительное:такт{ падеж:вин }
 n2=существительное:*{ падеж:дат одуш:неодуш }
} : links { p.<OBJECT>n1.<RIGHT_GENITIVE_OBJECT>n2 }


// ##########################################################################
// Паттерны описания времени дня, играют роль существительного среднего рода

wordentry_set ЧастьСуток=
{
 существительное:утро{},
 существительное:день{},
 существительное:вечер{},
 существительное:ночь{}
}
 
patterns ЧислоИлиЦифры export { РОД ПАДЕЖ node:root_node }

pattern ЧислоИлиЦифры export { (РОД) (ПАДЕЖ) node:root_node }
{
 num_word:*{}:export { node:root_node }
}

pattern ЧислоИлиЦифры export { РОД ПАДЕЖ node:root_node }
{
 числительное:*{} : export { РОД ПАДЕЖ node:root_node }
}

patterns ВремяСуток export { node:root_node ПАДЕЖ }

// Было уже десять часов вечера, и над садом светила полная луна
pattern ВремяСуток
{
 c=ЧислоИлиЦифры{ /*РОД:МУЖ*/ } :export{ ПАДЕЖ node:root_node }
 n=СУЩЕСТВИТЕЛЬНОЕ:ЧАС{ ПАДЕЖ:РОД }
 t=ЧастьСуток{ ЧИСЛО:ЕД ПАДЕЖ:РОД }
} : links { c.<OBJECT>n.<RIGHT_GENITIVE_OBJECT>t }

// Мы ели пюре в три часа ночи
pattern ГруппаНареч2
{
 @mark(предлог:*{},p):export{ node:root_node }
 n=ВремяСуток{ =p:падеж }
}
 : links { p.<OBJECT>n }
 : ngrams { 1 }



// Негромкие звуки гитары раздавались за стеной прошлой ночью
pattern ГруппаНареч2
{
 a='прошлой'{ падеж:твор }
 n='ночью'{ падеж:твор } :export{ node:root_node }
}
 : links { n.<ATTRIBUTE>a }
 : ngrams { 1 }




// в сентябре
pattern ГруппаНареч2
{
 p=предлог:в{}:export{ node:root_node }
 n=РусМесяц{ падеж:предл }
}
 : links { p.<OBJECT>n }
 : ngrams { 1 }


wordentry_set ЧастьМесяца=существительное:{
начало,  // в начале октября
конец, // в самом конце декабря
середина, // в середине мая
половина // в первой половине августа
}

// в середине мая
pattern ГруппаНареч2
{
 p=предлог:в{}:export{ node:root_node }
 n1=ЧастьМесяца{ падеж:предл число:ед }
 n2=РусМесяц{ падеж:род }
} : links
{ p.<OBJECT>n1.<OBJECT>n2 }
: ngrams { 2 }


// в самом конце декабря
pattern ГруппаНареч2
{
 p=предлог:в{}:export{ node:root_node }
 a=прилагательное:*{ ~КРАТКИЙ СТЕПЕНЬ:АТРИБ ПАДЕЖ:ПРЕДЛ ЧИСЛО:ЕД }
 n1=ЧастьМесяца{ падеж:предл число:ед =a:РОД }
 n2=РусМесяц{ падеж:род }
} : links
{
 p.<OBJECT>n1.{
               <RIGHT_GENITIVE_OBJECT>n2
               <ATTRIBUTE>a
              }
}
: ngrams { 2 }



// Он не смог явиться в силу сложившихся обстоятельств.
//                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
pattern ГруппаНареч2
{
 p=предлог:в{}:export{ node:root_node }
 n1='силу'
 n2=ГруппаСущ1{ ПАДЕЖ:РОД }
} : links { p.<OBJECT>n1.<RIGHT_GENITIVE_OBJECT>n2 }
  : ngrams { 1 }


// Она ложится спать в известный час.
pattern ГруппаНареч2
{
 p=предлог:в{}:export{ node:root_node }
 a='известный'{ падеж:вин }
 n='час'{ падеж:вин }
} : links { p.<OBJECT>n.<ATTRIBUTE>a }
  : ngrams { 1 }


// Я был дома после обеда
//            ^^^^^^^^^^^
pattern ГруппаНареч2
{
 p=предлог:после{}:export{ node:root_node }
 n='обеда'
} : links { p.<OBJECT>n }
  : ngrams { 1 }


/*
// Я просидел дома все праздники
//                 ^^^^^^^^^^^^^
pattern ГруппаНареч2
{
 a='все'{ падеж:вин число:мн }
 n='праздники'{ падеж:вин }:export{ node:root_node }
} : links { n.<ATTRIBUTE>a }
  : ngrams { 1 }


// Она просидела дома все выходные
//                    ^^^^^^^^^^^^
pattern ГруппаНареч2
{
 a='все'{ падеж:вин число:мн }
 n='выходные'{ class:существительное падеж:вин }:export{ node:root_node }
} : links { n.<ATTRIBUTE>a }
  : ngrams { 1 }
*/



// Характер писателя лучше всего выражается в его произведениях.
//                   ^^^^^^^^^^^
pattern ГруппаНареч2
{
 a1='лучше'{ class:наречие }
 a2='всего'{ class:наречие }:export{ node:root_node }
} : links { a2.<ATTRIBUTE>a1 }
  : ngrams { 1 }


// Вора поймали на месте преступления.
pattern ГруппаНареч2
{
 p=предлог:на{}:export{ node:root_node }
 n1='месте'{ падеж:предл }
 n2='преступления'{ падеж:род }
} : links { p.<OBJECT>n1.<RIGHT_GENITIVE_OBJECT>n2 }
  : ngrams { 3 }




// Этот город находится к западу от Москвы.
//                      ^^^^^^^^^^^^^^^^^^
pattern ГруппаНареч2
{
 p1=предлог:к{}:export{ node:root_node }
 n1=СторонаСвета{ падеж:дат число:ед }
 p2=предлог:от{}
 n2=ГруппаСущ1
} : links { p1.<OBJECT>n1.<PREPOS_ADJUNCT>p2.<OBJECT>n2 }
  : ngrams { 1 }


// Изо дня в день мы думаем и делаем одно и то же.
// ^^^^^^^^^^^^^^
pattern ГруппаНареч2
{
 p1='изо':export{ node:root_node }
 n1='дня'{ падеж:род }
 p2=предлог:в{}
 n2='день'{ class:существительное число:ед падеж:вин }
} : links { p1.<OBJECT>n1.<PREPOS_ADJUNCT>p2.<OBJECT>n2 }
  : ngrams { 2 }



// Который раз я говорю ему одно и то же.
// ^^^^^^^^^^^
pattern ГруппаНареч2
{
 a='который'{ падеж:им }
 n='раз'{ падеж:им }:export{ node:root_node }
} : links { n.<ATTRIBUTE>a }
  : ngrams { 1 }


// Сколько раз надо повторять одно и то же?
// ^^^^^^^^^^^
pattern ГруппаНареч2
{
 a='сколько'
 n='раз'{ падеж:им }:export{ node:root_node }
} : links { n.<ATTRIBUTE>a }
  : ngrams { 1 }

// ---------------------------------------------------------------

// Наш пароход держал курс прямо на север.
//                         ^^^^^^^^^^^^^^
pattern ГруппаНареч2
{
 a=наречие:прямо{}
 p1=предлог:на{}:export{ node:root_node }
 n1=ГлДополнение{ падеж:вин }
} : links { p1.{ <ATTRIBUTE>a <OBJECT>n1 } }
  : ngrams { 2 }


// Ричард остановил коня прямо перед ней.
//                       ^^^^^^^^^^^^^^^
pattern ГруппаНареч2
{
 a=наречие:прямо{}
 p1=предлог:перед{}:export{ node:root_node }
 n1=ГлДополнение{ падеж:твор }
} : links { p1.{ <ATTRIBUTE>a <OBJECT>n1 } }
  : ngrams { 2 }


// прямо сквозь стену палатки.
pattern ГруппаНареч2
{
 a=наречие:прямо{}
 p1=предлог:сквозь{}:export{ node:root_node }
 n1=ГлДополнение{ падеж:вин }
} : links { p1.{ <ATTRIBUTE>a <OBJECT>n1 } }
  : ngrams { 2 }


// Встанем поближе к выходу.
//         ^^^^^^^^^^^^^^^^
pattern ГруппаНареч2
{
 a=наречие:близко{ степень:сравн }
 p1=предлог:к{}:export{ node:root_node }
 n1=ГруппаСущ1{ падеж:дат }
} : links { p1.{ <ATTRIBUTE>a <OBJECT>n1 } }
  : ngrams { 2 }


// Ложись подальше от окна
pattern ГруппаНареч2
{
 a=наречие:далеко{ степень:сравн }
 p1=предлог:от{}:export{ node:root_node }
 n1=ГруппаСущ1{ падеж:род }
} : links { p1.{ <ATTRIBUTE>a <OBJECT>n1 } }
  : ngrams { 2 }


// Ветер дул ей прямо в лицо.
pattern ГруппаНареч2
{
 a=наречие:прямо{}
 p1=предлог:в{}:export{ node:root_node }
 n1=ГруппаСущ1{ падеж:вин число:ед }
} : links { p1.{ <ATTRIBUTE>a <OBJECT>n1 } }
  : ngrams { 2 }


// Он вернулся ровно в полдень.
pattern ГруппаНареч2
{
 a=наречие:ровно{}
 p1=предлог:в{}:export{ node:root_node }
 n1=существительное:полдень{ падеж:вин число:ед }
} : links { p1.{ <ATTRIBUTE>a <OBJECT>n1 } }
  : ngrams { 2 }


// Он выступил следом за докладчиком.
pattern ГруппаНареч2
{
 a=наречие:ровно{}
 p1=предлог:в{}:export{ node:root_node }
 n1=существительное:полдень{ падеж:вин число:ед }
} : links { p1.{ <ATTRIBUTE>a <OBJECT>n1 } }
 : ngrams { 2 }


// Он пришёл сюда прямо с работы.
//                ^^^^^^^^^^^^^^
pattern ГруппаНареч2
{
 a=наречие:прямо{}
 p1=предлог:с{}:export{ node:root_node }
 n1=ГруппаСущ1{ падеж:род }
} : links { p1.{ <ATTRIBUTE>a <OBJECT>n1 } }
  : ngrams { 2 }


// Он действует исключительно по своему произволу.
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
pattern ГруппаНареч2
{
 a=наречие:исключительно{}
 p1=предлог:по{}:export{ node:root_node }
 n1=ГруппаСущ1{ падеж:дат }
} : links { p1.{ <ATTRIBUTE>a <OBJECT>n1 } }
  : ngrams { 2 }


wordentry_set НаречЛокации1 = наречие:{ далеко, недалеко, близко, поблизости, вдалеке, неподалеку }

// Он живёт близко от школы.
//          ^^^^^^^^^^^^^^^
// Лодка отошла далеко от берега.
//              ^^^^^^^^^^^^^^^^
pattern ГруппаНареч2
{
 a=ГруппаНареч1{ НаречЛокации1 }
 p1=предлог:от{}:export{ node:root_node }
 n1=ГруппаСущ1{ падеж:род }
} : links { p1.{ <ATTRIBUTE>a <OBJECT>n1 } }
  : ngrams { 2 }

// ------------------------------------------------------------

// Он говорил в течение двадцати минут.
//            ^^^^^^^^^^^^^^^^^^^^^^^^
pattern ГруппаНареч2
{
 p=предлог:в течение{} : export { node:root_node }
 c=числительное:*{ падеж:род }
 n2=ГруппаСущ1{ падеж:род }
} : links { p.<OBJECT>c.<OBJECT>n2 }
: ngrams { 3 }


// Он должен повторить свои показания в присутствии свидетелей
//                                    ^^^^^^^^^^^^^^^^^^^^^^^^
pattern ГруппаНареч2
{
 p=предлог:в{} : export { node:root_node }
 n1='присутствии'{ падеж:предл }
 n2=ГруппаСущ1{ падеж:род }
} : links { p.<OBJECT>n1.<OBJECT>n2 }
: ngrams { 3 }

// Мы изложили своё мнение в общих чертах.
//                         ^^^^^^^^^^^^^^
pattern ГруппаНареч2
{
 p=предлог:в{} : export { node:root_node }
 a='общих'{ падеж:предл }
 n='чертах'{ падеж:предл }
} : links { p.<OBJECT>n.<ATTRIBUTE>a }
: ngrams { 3 }


// на протяжении всей жизни исследователя
pattern ГруппаНареч2
{
 p=предлог:на{} : export { node:root_node }
 n1='протяжении'{ падеж:предл }
 n2=ГруппаСущ4{ падеж:предл }
} : links { p.<OBJECT>n1.<RIGHT_GENITIVE_OBJECT>n2 }
: ngrams { 2 }






// присядь вот здесь
//         ^^^^^^^^^
pattern ГруппаНареч2
{
 p=частица:вот{}
 a=наречие:*{} : export { node:root_node }
} : links { a.<PREFIX_PARTICLE>p }
: ngrams { 1 }


// присядь вон там
//         ^^^^^^^
pattern ГруппаНареч2
{
 p=наречие:вон{}
 a=наречие:*{} : export { node:root_node }
} : links { a.<ATTRIBUTE>p }
: ngrams { 1 }



// Порядковые числительные и похожие прилагательные в роли обстоятельства:
// TODO: возможно нужна специальная валентность для глаголов, так как лишь немногие могут
//       участвовать в таких конструкциях.
// TODO: эти прилагательные вообще говоря согласуются с существительным по роду и числу.
//


wordentry_set ПорядкЧисл_Прил=прилагательное:{
 первый, второй, третий, четвертый, пятый, шестой, 
 седьмой, восьмой, девятый, десятый, одиннадцатый, двенадцатый, тринадцатый, четырнадцатый,
 пятнадцатый, шестнадцатый, семнадцатый, восемнадцатый, девятнадцатый, двадцатый, тридцатый,
 сороковой, пятидесятый, шестидесятый, семидесятый, восьмидесятый, девяностый
}

wordentry_set ПорядкЧислИПохож_Прил={
 ПорядкЧисл_Прил,
 прилагательное:последний{},
 прилагательное:предпоследний{}
}

wordentry_set ПорядкЧисл_Прил_100=числительное:
{ сто, двести, триста, четыреста, пятьсот, шестьсот, семьсот, восемьсот, девятьсот }

wordentry_set ПорядкЧисл_Прил_10=числительное:
{ двадцать, тридцать, сорок, пятьдесят, шестьдесят, семьдесят, восемьдесят, девяносто }

// Он приехал двадцать пятым
pattern ПорядкЧислКакОбст
{
 c1=ПорядкЧисл_Прил_10
 c2=ПорядкЧисл_Прил{ падеж:твор } : export { node:root_node ЧИСЛО РОД }
} : links { c2.<CONUMBER>c1 }

// Он приехал сто шестым
pattern ПорядкЧислКакОбст
{
 c1=ПорядкЧисл_Прил_100
 c2=ПорядкЧисл_Прил{ падеж:твор } : export { node:root_node ЧИСЛО РОД }
} : links { c2.<CONUMBER>c1 }

// ... TODO тысячи, и так далее

// Он приехал сто тридцать восьмым
pattern ПорядкЧислКакОбст
{
 c100=ПорядкЧисл_Прил_100
 c10=ПорядкЧисл_Прил_10
 c2=ПорядкЧисл_Прил{ падеж:твор } : export { node:root_node ЧИСЛО РОД }
} : links { c2.<CONUMBER>c100.<CONUMBER>c10 }


// первым тишину нарушил дикарь.
// ^^^^^^
pattern ПорядкЧислКакОбст
{
 ПорядкЧислИПохож_Прил{ падеж:твор } : export { node:root_node ЧИСЛО РОД }
}

// он приехал самым первым
//            ^^^^^^^^^^^^
pattern ПорядкЧислКакОбст
{
 a1=прилагательное:самый{ падеж:твор }
 a2=прилагательное:первый{ падеж:твор } : export { node:root_node ЧИСЛО РОД }
} : links { a2.<ATTRIBUTE>a1 }


// он приехал самым последним
//            ^^^^^^^^^^^^^^^
pattern ПорядкЧислКакОбст
{
 a1=прилагательное:самый{ падеж:твор }
 a2=прилагательное:последний{ падеж:твор } : export { node:root_node ЧИСЛО РОД }
} : links { a2.<ATTRIBUTE>a1 }



// ---------------------------------------------------------------------
// наречный паттерн: неизвестно откуда, неизвестно куда, неизвестно где,
//                   неизвестно как, ... + непонятно, неясно
// ---------------------------------------------------------------------

wordentry_set Неизвестно_1 = наречие:{ неизвестно, непонятно, неясно, невесть }
wordentry_set Откуда_1 = наречие:{ откуда, куда, где, почему, зачем, как, отчего }

// дети взялись неизвестно откуда. 
//              ^^^^^^^^^^^^^^^^^
pattern ГруппаНареч2
{
 a1=Неизвестно_1 { степень:атриб }
 a2=Откуда_1 : export { node:root_node }
} : links { a2.<ATTRIBUTE>a1 }
: ngrams { 2 }


// Мы останемся здесь на некоторое время.
//                    ^^^^^^^^^^^^^^^^^^^
pattern ГруппаНареч2
{
 p=предлог:на{} : export { node:root_node }
 a=ГруппаПрил1{ род:ср число:ед падеж:вин }
 n=существительное:время{ падеж:вин число:ед }
} : links { p.<OBJECT>n.<ATTRIBUTE>a }
: ngrams { 3 }


// обеспечиваться в любую погоду
//                ^^^^^^^^^^^^^^
pattern ГруппаНареч2
{
 p=предлог:в{} : export { node:root_node }
 a=ГруппаПрил1{ род:жен число:ед падеж:вин }
 n=существительное:погода{ падеж:вин число:ед }
} : links { p.<OBJECT>n.<ATTRIBUTE>a }
: ngrams { 3 }


// Вообще, это не совсем правильно - считать такие конструкции наречным оборотом.
// Но из-за сложностей с учетом падежной валентности при наличии счетного наречия
// пришлось пожертвовать чистотой:
//
// смещаться на несколько миллиметров
//           ^^^^^^^^^^^^^^^^^^^^^^^^
pattern ГруппаНареч2
{
 p=предлог:на{} : export { node:root_node }
 q=НаречДляРод
 n=СущСРодДоп{ ПАДЕЖ:РОД }
} : links { p.<OBJECT>n.<ATTRIBUTE>q }
: ngrams { 2 }


// убавить на два уровня
//         ^^^^^^^^^^^^^
pattern ГруппаНареч2
{
 p=предлог:на{} : export { node:root_node }
 q=числительное:*{ падеж:вин }
 n=СущСРодДоп{ ПАДЕЖ:РОД }
} : links { p.<OBJECT>q.<RIGHT_GENITIVE_OBJECT>n }
: ngrams { 2 }


// поворачиваться на 180 градусов
///               ^^^^^^^^^^^^^^^
pattern ГруппаНареч2
{
 p=предлог:на{} : export { node:root_node }
 q=num_word:*{}
 n=СущСРодДоп{ ПАДЕЖ:РОД }
} : links { p.<OBJECT>q.<RIGHT_GENITIVE_OBJECT>n }
: ngrams { 2 }


// прошло около пятнадцати минут.
//        ^^^^^^^^^^^^^^^^^^^^^^
pattern ГруппаНареч2
{
 p=предлог:около{} : export { node:root_node }
 q=числительное:*{ падеж:род }
 n=СущСРодДоп{ ПАДЕЖ:РОД }
} : links { p.<OBJECT>q.<RIGHT_GENITIVE_OBJECT>n }
: ngrams { 2 }


// Наречный паттерн с постфиксом НЕКУДА:
// замок оказался проще некуда.
//                ^^^^^^^^^^^^
pattern ГруппаНареч2
{
 a=наречие:*{ степень:сравн } : export { node:root_node }
 p=наречие:некуда{}
} : links { a.<ATTRIBUTE>p }
: ngrams { 5 }


// Ребёнок начинает говорить на втором году от рождения.
pattern ГруппаНареч2
{
 prep1=предлог:на{} : export { node:root_node }
 a=ПорядкЧислИПохож_Прил{ ПАДЕЖ:ПРЕДЛ ЧИСЛО:ЕД РОД:МУЖ }
 n1=существительное:год{ падеж:парт }
 prep2=предлог:от{}
 n2=ГруппаСущ1{ падеж:род число:ед }
} : links
{
 prep1.<OBJECT>n1.{
                   <ATTRIBUTE>a
                   <PREPOS_ADJUNCT>prep2.<OBJECT>n2
                  }
}
: ngrams { 5 }


patterns ЭквивалентКакБудто export { node:root_node }


// свечи вспыхнули словно сами собой.
//                 ^^^^^^^^^^^^^^^^^
pattern ГруппаНареч2
{
 mod=ЭквивалентКакБудто
 a=СамПрефикс{ падеж:им } : export{ node:root_node }
 n='собой'{ падеж:твор }
} : links
{
 a.{
    <ATTRIBUTE>mod
    <NEXT_COLLOCATION_ITEM>n
   }
}


// Впрочем, он с удовольствием поел бы и сам.
//                                     ^^^^^
/*
pattern ГруппаНареч2
{
 p=частица:и{}
 a=прилагательное:сам{} : export{ node:root_node }
}
: links { a.<PREFIX_PARTICLE>p }
: ngrams { -4 }
*/


pattern ГруппаНареч2
{
 ПрилСамОбъект : export{ node:root_node }
}
: ngrams { -4 }

/*
// Сами-то мы его не понимаем
// ^^^^^^^
pattern ГруппаНареч2
{
 a=прилагательное:сам{} : export{ node:root_node }
 t='-'
 p=частица:то{}
}
: links { a.<POSTFIX_PARTICLE>t.<NEXT_COLLOCATION_ITEM>p }
: ngrams { -1 } // вообще, это не очень хороший путь, поэтому штрафуем

// Он и сам-то испугался
pattern ГруппаНареч2
{
 p=частица:и{}
 a=прилагательное:сам{} : export{ node:root_node }
 t='-'
 p2=частица:то{}
}
: links { a.{
              <PREFIX_PARTICLE>p
              <POSTFIX_PARTICLE>t.<NEXT_COLLOCATION_ITEM>p2
             }
         }
: ngrams { -4 }
*/

// Прилагательное ОДИН очень часто отрывается от своего определямого
// слова и стоит в другой части предложения. Для простоты будем рассматривать
// его как обстоятельство:
// его нельзя пускать одного
//                    ^^^^^^
pattern Обст
{
 прилагательное:один{} : export{ node:root_node }
} : ngrams { -8 }



// Обстоятельство способа САМ СОБОЙ:
// остальное произошло само собой.
//                     ^^^^^^^^^^
pattern Обст
{
 a=СамПрефикс{ падеж:им } : export{ node:root_node }
 n='собой'{ падеж:твор }
} : links { a.<NEXT_COLLOCATION_ITEM>n }


// слово САМ в роли обстоятельства способа
// судьба сама приведет вас туда.
//        ^^^^
pattern Обст
{
 СамПрефикс : export{ node:root_node }
} : ngrams { -3 } // вообще, это не очень хороший путь, поэтому штрафуем


// тем временем вокруг собралась толпа.
// ^^^^^^^^^^^^
pattern Обст
{
 a=прилагательное:тот{ падеж:твор род:ср число:ед }
 n=существительное:время{ падеж:твор число:ед } : export { node:root_node }
} : links { n.<ATTRIBUTE>a }
: ngrams { 5 }


// шаги между тем быстро приближались.
//      ^^^^^^^^^
pattern Обст
{
 p=предлог:между{} : export { node:root_node }
 a=прилагательное:тот{ падеж:твор род:ср число:ед }
} : links { p.<OBJECT>a }
: ngrams { 5 }


// со временем увидишь сам.
// ^^^^^^^^^^^
pattern Обст
{
 p=предлог:с{} : export { node:root_node }
 n=существительное:время{ падеж:твор }
} : links { p.<OBJECT>n }
: ngrams { 5 }


// Его судьба должна была решиться в тот день.
//                                 ^^^^^^^^^^
pattern Обст
{
 p=предлог:в{} : export { node:root_node }
 a=прилагательное:*{ падеж:вин число:ед род:муж ~краткий }
 n=существительное:день{ падеж:вин }
} : links { p.<OBJECT>n.<ATTRIBUTE>a }
: ngrams { 5 }


// женщина вернулась почти сразу же.
//                   ^^^^^^^^^^^^^^
pattern Обст
{
 mod=наречие:почти{}
 a=наречие:*{} : export { node:root_node }
 p=частица:же{}
} : links { a.{ <ATTRIBUTE>mod <POSTFIX_PARTICLE>p } }
: ngrams { 5 }


// именно так они представляют самих себя.
// ^^^^^^^^^^
pattern ГруппаНареч2
{
 mod=наречие:именно{}
 a=наречие:*{} : export { node:root_node }
} : links { a.<ATTRIBUTE>mod }
: ngrams { 5 }

// КАК МОЖНО + компаратив наречия:
// надо увидеть как можно больше.
//              ^^^^^^^^^^^^^^^^
pattern ГруппаНареч2
{
 w1=наречие:как{}
 w2='можно'
 a=наречие:*{ степень:сравн } : export { node:root_node }
} : links { a.<ATTRIBUTE>w2.<ATTRIBUTE>w1 }
: ngrams { 7 }


// мой отец поступил бы таким образом?
//                      ^^^^^^^^^^^^^
pattern Обст
{
 a='таким'{ падеж:твор род:муж }
 n='образом'{ падеж:твор } : export { node:root_node }
} : links { n.<ATTRIBUTE>a }
: ngrams { 3 }


// только таким образом можно спасти людей.
// ^^^^^^^^^^^^^^^^^^^^
pattern Обст
{
 mod=наречие:только{}
 a='таким'{ падеж:твор род:муж }
 n='образом'{ падеж:твор } : export { node:root_node }
} : links { n.<ATTRIBUTE>a.<ATTRIBUTE>mod }
: ngrams { 3 }


// люди спят тем более.
//           ^^^^^^^^^
pattern ГруппаНареч2
{
 mod='тем'{ class:местоим_сущ падеж:твор }
 a='более'{ class:наречие } : export { node:root_node }
} : links { a.<ATTRIBUTE>mod }
: ngrams { 3 }

// убить могут где угодно.
//             ^^^^^^^^^^
pattern ГруппаНареч2
{
 a=наречие:где{} : export { node:root_node }
 mod=наречие:угодно{}
} : links { a.<ATTRIBUTE>mod }
: ngrams { 3 }

// остается найти где именно.
//                ^^^^^^^^^^
pattern Обст
{
 a=наречие:где{} : export { node:root_node }
 mod=наречие:именно{}
} : links { a.<ATTRIBUTE>mod }
: ngrams { 3 }


// ночевать им приходилось где попало.
//                         ^^^^^^^^^^
pattern ГруппаНареч2
{
 a=наречие:где{} : export { node:root_node }
 mod='попало'
} : links { a.<ATTRIBUTE>mod }
: ngrams { 3 }


// это мало где требуется.
//     ^^^^^^^^
pattern ГруппаНареч2
{
 mod=наречие:мало{}
 a=наречие:где{} : export { node:root_node }
} : links { a.<ATTRIBUTE>mod }
: ngrams { 2 }


wordentry_set НаречДляЭто=наречие:{
 как, где, когда, куда, почему, отчего, зачем, сколько, докуда, откуда
}


// где это вы прятались?
pattern ГруппаНареч2
{
 a=НаречДляЭто : export { node:root_node }
 mod=частица:это{}
} : links { a.<POSTFIX_PARTICLE>mod }
: ngrams { -4 }


// где ж это ты был до сей поры?
// ^^^^^^^^^
pattern ГруппаНареч2
{
 a=НаречДляЭто : export { node:root_node }
 z=ЧастицаЖе
 mod=частица:это{}
} : links { a.{
               <POSTFIX_PARTICLE>z
               <POSTFIX_PARTICLE>mod
              } }
: ngrams { -5 }


// первым делом надо выбрать нужный момент.
// ^^^^^^^^^^^^
pattern ГруппаНареч2
{
 a='первым'{ падеж:твор род:ср }
 n='делом'{} : export { node:root_node }
} : links { n.<ATTRIBUTE>a }


// --------------------------------

wordentry_set СоюзЧтобы=союз:{
 чтобы,
 чтоб,
 "прежде чем" // Она поколебалась, прежде чем ответить.
}

// Природа не пожалела красок,  чтоб ее одеть.
//                           ^^^^^^^^^^^^^^^^^  
// Папа вкалывает, чтобы прокормить семью
//               ^^^^^^^^^^^^^^^^^^^^^^^^
pattern Обст
{
 comma=','
 conj=СоюзЧтобы : export { node:root_node }
 inf=Инф2
 @noshift(ПравыйОграничительОборота)
 comma2=@coalesce(',')
} : links
{
 conj.{
       <PUNCTUATION>comma
       <INFINITIVE>inf.~<PUNCTUATION>comma2
      }
}


// Чтобы прокормить семью, папа вкалывает на работе
// ^^^^^^^^^^^^^^^^^^^^^^^
pattern Обст
{
 conj=союз:чтобы{} : export { node:root_node }
 inf=Инф2
 comma2=','
} : links
{
 conj.<INFINITIVE>inf.<PUNCTUATION>comma2
}



// вместо того чтобы купить сливок, он валялся весь день на диване
pattern Обст
{
 p=предлог:вместо{} : export { node:root_node }
 n=местоим_сущ:то{ падеж:род }
 conj=союз:чтобы{}
 inf=Инф2
 comma=','
} : links
{
 p.<OBJECT>n.
  <SUBORDINATE_CLAUSE>conj.{
                            <PUNCTUATION>comma
                            <INFINITIVE>inf
                           }
}
: ngrams { 1 }


// мне не раз случалось видеть такое
//     ^^^^^^
pattern Обст
{
 n=частица:не{}
 a=наречие:раз{} : export { node:root_node }
} : links { a.<NEGATION_PARTICLE>n }
  : ngrams { 2 }


// Ольга изо всех сил держала лицо неподвижным.
//       ^^^^^^^^^^^^
pattern Обст
{
 p=предлог:из{} : export { node:root_node }
 a=ГруппаПрил1{ падеж:род число:мн }
 n=существительное:сила{ падеж:род число:мн } 
} : links { p.<OBJECT>n.<ATTRIBUTE>a }
: ngrams { 1 }


// В Московской обл. в аквапарке утонул 8-летний ребенок
//   ^^^^^^^^^^^^^^^
pattern Обст
{
 prep=предлог:в{} : export { node:root_node }
 a=прилагательное:*{ число:ед род:жен падеж:предл }
 n='обл.'
} : links { prep.<OBJECT>n.<ATTRIBUTE>a }


// в первой половине невероятным образом промахнулся экс-форвард московского ЦСКА
//                   ^^^^^^^^^^^^^^^^^^^
// а каким же образом о нем узнали вы?
//   ^^^^^^^^
pattern Обст
{
 a=прилагательное:*{ число:ед род:муж падеж:твор ~краткий }
 p=@optional(частица:же{})
 n='образом' : export { node:root_node }
} : links { n.<ATTRIBUTE>a.~<POSTFIX_PARTICLE>p }



// В Красноярском крае стая волков растерзала 10-летнего мальчика
// ^^^^^^^^^^^^^^^^^^^
pattern Обст
{
 prep=предлог:в{} : export { node:root_node }
 a=прилагательное:*{ число:ед род:муж падеж:предл }
 n='крае'
} : links { prep.<OBJECT>n.<ATTRIBUTE>a }


// На месторождении под Тюменью произошел взрыв
//                  ^^^^^^^^^^^
wordentry_set ПредлогОбстМеста = предлог:{ в, на, под }

// В Сеуле вышли из строя компьютерные сети ведущих банков и телеканалов
// ^^^^^^^
pattern Обст
{
 prep=ПредлогОбстМеста : export { node:root_node }
 n=существительное:*{ CharCasing:FirstCapitalized <в_класс>СУЩЕСТВИТЕЛЬНОЕ:город{} =prep:ПАДЕЖ }
}
: links { prep.<OBJECT>n }
: ngrams { -1 }

// В Сингапуре достраивают грандиозный парк развлечений
// ^^^^^^^^^^^
pattern Обст
{
 prep=ПредлогОбстМеста : export { node:root_node }
 n=существительное:*{ CharCasing:FirstCapitalized <в_класс>СУЩЕСТВИТЕЛЬНОЕ:страна{} =prep:ПАДЕЖ }
}
: links { prep.<OBJECT>n }
: ngrams { -1 }


// Обстоятельственный оборот В ОБХОД чего-то
// Украина может поставить самолеты еще одной стране-изгою в обход санкций США (Украина может поставить самолеты еще одной стране-изгою)
//                                                         ^^^^^^^^^^^^^^^^^^^
pattern Обст
{
 prep=предлог:в{} : export { node:root_node }
 n1=существительное:обход{ число:ед падеж:вин }
 n2=ГруппаСущ4{ ПАДЕЖ:РОД }
} : links { prep.<OBJECT>n1.<RIGHT_GENITIVE_OBJECT>n2 }


// --------------------------------------------------------

wordentry_set ПодчинСоюз0=союз:{ когда, если }


patterns ПодчинСоюз export { node:root_node }

pattern ПодчинСоюз
{
 ПодчинСоюз0 : export { node:root_node }
}

wordentry_set МодифПодчинСоед=наречие:{ даже, только }
// Он будет бороться, даже если ему угрожает опасность
//                    ^^^^^^^^^
pattern ПодчинСоюз
{
 mod=МодифПодчинСоед
 conj=ПодчинСоюз0 : export { node:root_node }
}

// -------------------------------------------------------

patterns ПодчиненноеДляЕсли export { node:root_node }

pattern ПодчиненноеДляЕсли
{
 Предикат : export { node:root_node }
}

// он  будет  погублен, если его заметят
pattern ПодчиненноеДляЕсли
{
 Сказуемое : export { node:root_node }
}


// Меня подташнивает, когда люди начинают произносить пафосные речи
//                  ^^^^^^^...
pattern Обст
{
 comma=','
 conj=ПодчинСоюз : export { node:root_node }
 p=ПодчиненноеДляЕсли
 @noshift(ПравыйОграничительОборота)
 comma2=@optional(',')
} : links
{
 conj.{
       <PUNCTUATION>comma
       <SUBORDINATE_CLAUSE>p.~<PUNCTUATION>comma2
      }
}


// --------------------------------------------------------


// Московские аэропорты работают штатно, несмотря на гололед в столице
//                                     ^^^^^^^^^^^^^ ...
pattern Обст
{
 comma=','
 prep=предлог:несмотря на{} : export { node:root_node }
 n=ГруппаСущ4{ ПАДЕЖ:ВИН }
 @noshift(ПравыйОграничительОборота)
 comma2=@coalesce(',')
} : links
{
 prep.{
       <OBJECT>n
       <PUNCTUATION>comma
       ~<PUNCTUATION>comma2
      }
}

// тебе нужен мир любой ценой.
//                ^^^^^^^^^^^
pattern Обст
{
 a='любой'{ падеж:твор }
 n='ценой'{ падеж:твор } : export { node:root_node }
} : links { n.<ATTRIBUTE>a }


// во второй раз им повезло гораздо меньше.
// ^^^^^^^^^^^^^
pattern ГруппаНареч2
{
 p=предлог:в{}:export{ node:root_node }
 a=ГруппаПрил1{ падеж:вин род:муж число:ед }
 n='раз'{ падеж:вин }
} : links { p.<OBJECT>n.<ATTRIBUTE>a }
  : ngrams { 1 }

// это происходит само по себе.
//                ^^^^^^^^^^^^
pattern ГруппаНареч2
{
 a1=прилагательное:сам{}:export{ node:root_node }
 p=предлог:по{}
 a2='себе'{ падеж:дат }
} : links { a1.<PREPOS_ADJUNCT>p.<OBJECT>a2 }
  : ngrams { 1 }

// Произошло это после того, как один из морпехов открыл стрельбу по сослуживцам
//               ^^^^^^^^^^^^^^^ ...
pattern ГруппаНареч2
{
 p=предлог:*{}:export{ node:root_node }
 n=местоим_сущ:то{ =p:падеж }
 comma=','
 conj=союз:как{}
 w=Предикат
 @noshift(ПравыйОграничительОборота)
} : links
{
 p.<OBJECT>n.
    <SUBORDINATE_CLAUSE>comma.
     <NEXT_COLLOCATION_ITEM>conj.
      <NEXT_COLLOCATION_ITEM>w
}
: ngrams { 15 }


/*
// Прилагательное ВЕСЬ в роли обстоятельства.
// отсюда остров был виден весь.
//                         ^^^^
pattern ГруппаНареч2
{
 прилагательное:весь{ падеж:им }:export{ node:root_node }
} : ngrams { -5 }
*/


// В комнате больше никого не было.
//           ^^^^^^ ~~~~~~
wordentry_set НеПрисоедКомпаратив=
{
 местоим_сущ:ничто{},
 местоим_сущ:нечто{}, // Здесь нам делать больше нечего.
 местоим_сущ:некто{},
 местоим_сущ:никто{}
}


// ??? эту конструкцию лучше переделать на рематическую для
// глаголов-связок типа СТАЛ, ОКАЗАЛСЯ и т.д.
// Компаратив прилагательного может присоединять прямое дополнение,
// в этом случае он выступает в роли обстоятельства:
//
// купол выглядел темнее стен
//                ^^^^^^ ^^^^
pattern Обст
{
 adv=@optional(НаречДляСравн)
 adj=прилагательное:*{ СТЕПЕНЬ:СРАВН ~ИсклСравнПрил }:export { node:root_node }
 obj=РодДополнение{ ~НеПрисоедКомпаратив }
} : links
{
 adj.{
      <OBJECT>obj
      ~<ATTRIBUTE>adv
     }
}


/*
// Полное прилагательное также может быть частью такого паттерна с компаративом:
// купол выглядел темнее обычного.
//                ^^^^^^^^^^^^^^^
pattern Обст
{
 adv=@optional(НаречДляСравн)
 adj=прилагательное:*{ СТЕПЕНЬ:СРАВН ~ИсклСравнПрил }:export { node:root_node }
 obj=прилагательное{ падеж:род род:ср число:ед ~краткий степень:атриб }
} : links
{
 adj.{
      <OBJECT>obj
      ~<ATTRIBUTE>adv
     }
}
: ngrams { -1 }
*/

// Найти безопасное место для сна так и не удалось.
//                                ^^^^^
pattern ГруппаНареч2
{
 a=наречие:так{}:export{ node:root_node }
 p=частица:и{}
} : links { a.<POSTFIX_PARTICLE>p }
  : ngrams { -1 }



wordentry_set НаречияМодифЧуть=наречие:{
 сзади, спереди, сверху, снизу, сбоку, слева, справа, позади, впереди
}

// чуть сзади, почтительно приотстав, его сопровождала пара вооруженных ратников.
// ^^^^^^^^^^
pattern ГруппаНареч2
{
 mod=наречие:чуть{}
 a=НаречияМодифЧуть:export{ node:root_node }
} : links { a.<ATTRIBUTE>mod }


// Работать за четверых
//          ^^^^^^^^^^^
pattern Обст
{
 p=предлог:за{}:export{ node:root_node }
 n=числительное:*{ падеж:вин КАТЕГОРИЯ_ЧИСЛ:СОБИР }
} : links { p.<OBJECT>n }


// это меня удивило более всего!
//                  ^^^^^^^^^^^
pattern Обст
{
 adv=Нареч1{ СТЕПЕНЬ:СРАВН } : export { node:root_node }
 obj=местоим_сущ:все{ падеж:род }
} : links { adv.<OBJECT>obj }


// как им удается по желанию создавать новые виды разумных существ?
//                ^^^^^^^^^^
pattern Обст
{
 p=предлог:по{}:export{ node:root_node }
 n='желанию'
} : links { p.<OBJECT>n }
: ngrams { 1 }


wordentry_set НаречДляУгодно= наречие:{ куда, где, откуда, когда }

// за таким можно пойти куда угодно!
//                      ^^^^^^^^^^^
pattern Обст
{
 a=НаречДляУгодно : export { node:root_node }
 mod=наречие:угодно{}
} : links { a.<ATTRIBUTE>mod }
: ngrams { 1 }



wordentry_set СкольКак=наречие:{ сколь, как }

// над этим вопросом можно размышлять сколь угодно долго
//                                    ^^^^^^^^^^^^^^^^^^
pattern Обст
{
 mod1=СкольКак
 mod2=наречие:угодно{}
 adv=наречие:*{} : export { node:root_node }
}
: links { adv.<ATTRIBUTE>mod2.<ATTRIBUTE>mod1 }
: ngrams { 1 }


// времени оставалось всего ничего
//                    ^^^^^^^^^^^^
pattern Обст
{
 mod=наречие:всего{}
 a=наречие:ничего{} : export { node:root_node }
} : links { a.<ATTRIBUTE>mod }
: ngrams { 1 }

// а вот получится такой фокус второй раз или же нет?
//                             ^^^^^^^^^^
pattern Обст
{
 a=прилагательное:*{ ТИП_ПРИЛ:ПОРЯДК ПАДЕЖ:ВИН ЧИСЛО:ЕД РОД:МУЖ }
 n=существительное:раз{ ПАДЕЖ:ВИН ЧИСЛО:ЕД } : export { node:root_node }
} : links { n.<ATTRIBUTE>a }
: ngrams { 1 }


// ЧТО может выступать как обстоятельство, синоним ПОЧЕМУ:
// Что ж ты стоишь?
// ^^^^^
pattern Обст
{
 n=местоим_сущ:что{ падеж:вин } : export { node:root_node }
 p=@optional(ЧастицаЖе)
} : links { n.~<POSTFIX_PARTICLE>p }
: ngrams { -10 }

// ЧТО-ТО в роли показателя неопределенности/неуверенности:
// Я что-то плохо себя чувствую
//   ^^^^^^
pattern Обст
{
 местоим_сущ:что-то{ падеж:вин } : export { node:root_node }
}
: ngrams { -5 }


wordentry_set СопоставСоюз=
{
 союз:как{},
 наречие:будто{},
 наречие:словно{}
}

// Дрожит, как осиновый лист.
//       ^^^^^^^^^^^^^^^^^^^
// - Костя, не вышагивай, как журавль!
//                      ^^^^^^^^^^^^^
// Как многие люди, они постоянно  держат рты открытыми.
// ^^^^^^^^^^^^^^^^
pattern Обст
{
 comma1=@optional(',')
 conj=СопоставСоюз : export { node:root_node }
 obj=ГруппаСущ4{ ПАДЕЖ:ИМ }
 @noshift(ПравыйОграничительОборота)
 comma2=@coalesce(',')
}
: links
{
 conj.{
        ~<PUNCTUATION>comma1
        <OBJECT>obj
        ~<PUNCTUATION>comma2
       }
}
: ngrams { 5 }



// Спортивная машина, как он и думал, принадлежала женщине.
//                  ^^^^^^^^^^^^^^^^^
pattern Обст
{
 @probe_left(ЛевыйОграничительОборота)
 comma1=@optional(',')
 attr=наречие:как{}
 p=Предикат : export { node:root_node }
 @noshift(ПравыйОграничительОборота)
 comma2=@coalesce(',')
}
: links
{
 p.{
    ~<PUNCTUATION>comma1
    <ATTRIBUTE>attr
    ~<PUNCTUATION>comma2
   }
}
: ngrams { 3 }


// ------------------------------------------

wordentry_set БезличНадо=безлич_глагол:{ надо, следует, нужно, положено }

// все идет как надо
//          ^^^^^^^^
pattern Обст
{
 w1=наречие:как{} : export { node:root_node }
 w2=БезличНадо
} : links { w1.<NEXT_COLLOCATION_ITEM>w2 }
: ngrams { -1 }

// Карандаш еще шел не так, как надо
//                  ^^^^^^^^^^^^^^^^
pattern Обст
{
 n=частица:не{}
 w1=наречие:так{} : export { node:root_node }
 comma=','
 w2=наречие:как{}
 w3=БезличНадо
} : links {
w1.{
    <NEGATION_PARTICLE>n
    <NEXT_COLLOCATION_ITEM>comma.
     <NEXT_COLLOCATION_ITEM>w2
      <NEXT_COLLOCATION_ITEM>w3
   }
}
//: ngrams { 1 }


// ------------------------------------------------------
// Обстоятельственные обороты типа "Он с ужасом отпрянул"

patterns Обст_ПредлогИСущ export { node:root_node }

pattern Обст
{
 Обст_ПредлогИСущ : export { node:root_node }
}

// Надя  даже  на  костылях  ходит  с трудом и очень медленно.
// todo: переделать на восходящую сборку
pattern Обст
{
 a1=Обст_ПредлогИСущ : export { node:root_node }
 conj=ЛогичСоюз
 a2=ГруппаНареч1
} : links { a1.<RIGHT_LOGIC_ITEM>conj.<NEXT_COLLOCATION_ITEM>a2 }




// +++++++

pattern Обст_ПредлогИСущ
{
 prep=предлог:с{} : export { node:root_node }
 obj=ГруппаСущ4{ Сущ_ДляОбст_С падеж:твор }
}
: links { prep.<OBJECT>obj }
: ngrams
{
 5
 ВалентностьПредлога(prep)
}



// Оборот БЕЗ КОЛЕБАНИЙ обычно присоединяется к глаголам:
// землянин без колебаний последовал за ним.
//          ^^^^^^^^^^^^^^^^^^^^^^^^
pattern Обст_ПредлогИСущ
{
 prep=предлог:без{} : export { node:root_node }
 obj=ГруппаСущ4{ Сущ_ДляОбст_БЕЗ падеж:род }
}
: links { prep.<OBJECT>obj }
: ngrams
{
 5
 ВалентностьПредлога(prep)
}

// Обстоятельственные обороты с предлогом ОТ:
// монах открыл рот от изумления.
//       ^^^^^^     ^^
pattern Обст_ПредлогИСущ
{
 prep=предлог:от{} : export { node:root_node }
 obj=ГруппаСущ4{ Сущ_ДляОбст_ОТ падеж:род }
}
: links { prep.<OBJECT>obj }
: ngrams
{
 5
 ВалентностьПредлога(prep)
}

// Рыцарь в страхе попятился
//        ^^^^^^^^
pattern Обст_ПредлогИСущ
{
 prep=предлог:в{} : export { node:root_node }
 obj=ГруппаСущ4{ Сущ_ДляОбст_В падеж:предл }
}
: links { prep.<OBJECT>obj }
: ngrams
{
 5
 ВалентностьПредлога(prep)
}

// --------------------------------

// Олег изо всех сил зажмурился.
//      ^^^          ^^^^^^^^^^
pattern Обст_ПредлогИСущ
{
 prep=предлог:из{} : export { node:root_node }
 obj=ГруппаСущ4{ Сущ_ДляОбст_ИЗ падеж:предл }
}
: links { prep.<OBJECT>obj }
: ngrams
{
 5
 ВалентностьПредлога(prep)
}


// --------------------------------------------
//
// он вернулся туда, откуда уехал много лет назад
//             ^^^^^^^^^^^^ ....

wordentry_set СоставнНареч2_1 = наречие:{ туда, оттуда, там, тут, здесь, везде, всюду, тогда, всегда }
wordentry_set СоставнНареч2_2 = наречие:{ откуда, куда, где, когда }

patterns СоставнНареч2_11 export { node:root_node }
pattern СоставнНареч2_11
{
 ГруппаНареч2{СоставнНареч2_1}:export { node:root_node }
}

// ... всякий раз, когда ...
//     ^^^^^^^^^^
pattern СоставнНареч2_11
{
 a=прилагательное:*{ падеж:вин число:ед род:муж }
 n=существительное:раз{} : export { node:root_node }
} : links { n.<ATTRIBUTE>a }


pattern Обст
{
 adv1= СоставнНареч2_11 : export { node:root_node }
 comma1=','
 @noshift(СоставнНареч2_2)
 p=Предикат
 @noshift(ПравыйОграничительОборота)
 comma2=@coalesce(',')
}
: links
{
 adv1.{
       <PUNCTUATION>comma1
       <SUBORDINATE_CLAUSE>p
       ~<PUNCTUATION>comma2
      }
}
: ngrams { 2 }


// Все уже распределены и поедут туда, куда сказано.
//                               ^^^^^^^^^^^^^^^^^^
pattern Обст
{
 adv1= СоставнНареч2_11 : export { node:root_node }
 comma1=','
 @noshift(СоставнНареч2_2)
 p=Сказуемое0
 @noshift(ПравыйОграничительОборота)
 comma2=@coalesce(',')
}
: links
{
 adv1.{
       <PUNCTUATION>comma1
       <SUBORDINATE_CLAUSE>p
       ~<PUNCTUATION>comma2
      }
}
: ngrams { 2 }


// По мере того как мы поднимались в гору, горизонт расширялся
// ^^^^^^^^^^^^^^^^
pattern Обст
{
 prep= предлог:по мере{} : export { node:root_node }
 obj='того'{ class:местоим_сущ падеж:род }
 conj=союз:как{}
 p=Предикат
 @noshift(ПравыйОграничительОборота)
 comma2=@coalesce(',')
}
: links
{
 prep.<OBJECT>obj.
      <SUBORDINATE_CLAUSE>conj.<NEXT_COLLOCATION_ITEM>p.
       ~<PUNCTUATION>comma2
}
: ngrams
{
 10
}


// ЧЕГО может выступать в роли обстоятельства, как синоним ЗАЧЕМ:
// так чего же ты разбудил меня сейчас?
//     ^^^^^^^
pattern Обст
{
 a='чего'{ class:местоим_сущ } : export { node:root_node }
 p=@optional(ЧастицаЖе)
} : links { a.~<POSTFIX_PARTICLE>p }
: ngrams { -5 }


// -------------------------
// Обстоятельства длины
// -------------------------

// отряд прошел по этому туннелю около мили
//                               ^^^^^^^^^^
pattern Обст
{
 prep=предлог:около{} : export { node:root_node }
 obj=ЕдиницыДлины{ =prep:ПАДЕЖ }
}
: links { prep.<OBJECT>obj }
: ngrams { 2 }


// -------------------------------------------------------
// Обстоятельства способа, выражаемые творительным падежом
// с некоторыми существительными.
// -------------------------------------------------------
wordentry_set ТранспСпособ=существительное:{
поезд, самолет, трамвай, автобус,
авиалайнер, авиарейс, вертолет, лайнер, легковушка,
лифт, маршрутка, метро, метрополитен, почта, спецрейс,
суперлайнер, теплоход, пароход, троллейбус, фрегат,
чартер, экспресс, электричка, такси, попутка, грузовик
}


// ездить на работу трамваем
//                  ^^^^^^^^
// добираться на работу автобусом
//                      ^^^^^^^^^
pattern Обст
{
 ГруппаСущ4{ ТранспСпособ ПАДЕЖ:ТВОР } : export { node:root_node }
}
: ngrams { -2 }

// ++++++++++++++++++++++++++++++++++

patterns ОбъектДляТакжеКак export { node:root_node }

// они работают так же, как у моллюска
//              ^^^^^^^^^^^^^^^^^^^^^^
pattern ОбъектДляТакжеКак
{
 ПредлогИСущ : export { node:root_node }
 @noshift(ПравыйОграничительОборота)
}

// мое брюхо кричало от голода так же, как  ваше
//                             ^^^^^^^^^^^^^^^^^
pattern ОбъектДляТакжеКак
{
 ГлДополнение : export { node:root_node }
 @noshift(ПравыйОграничительОборота)
}

// боеприпасы вот  так же, как сейчас, валялись на берегу Березины...
//                               ^^^^^^
pattern ОбъектДляТакжеКак
{
 Обст : export { node:root_node }
 @noshift(ПравыйОграничительОборота)
}

// Он  воспитывал  мальчика  так же, как был воспитан сам
//                                       ^^^^^^^^^^^^^^^^
pattern ОбъектДляТакжеКак
{
 ПридаточноеВОбороте : export { node:root_node }
}

wordentry_set НаречиеТакКакОборот0={ наречие:так{} }

patterns НаречиеТакКакОборот export { node:root_node }

pattern НаречиеТакКакОборот
{
 ГруппаНареч1{ НаречиеТакКакОборот0 } : export { node:root_node }
}

pattern НаречиеТакКакОборот
{
 mod=наречие:совсем{}
 a=ГруппаНареч1{ НаречиеТакКакОборот0 } : export { node:root_node }
} : links { a.<ATTRIBUTE>mod }
: ngrams { 1 }


// они работают так же, как у моллюска
//              ^^^^^^^^^^^ ...
pattern Обст
{
 conj1=НаречиеТакКакОборот : export { node:root_node }
 comma1=','
 conj2=наречие:как{}
 obj=ОбъектДляТакжеКак
 comma2=@coalesce(',')
}
: links
{
 conj1.{
        <PUNCTUATION>comma1
        <SUBORDINATE_CLAUSE>conj2.<NEXT_COLLOCATION_ITEM>obj
        ~<PUNCTUATION>comma2
       }
}
: ngrams { 10 }


// Шрамы  и  порезы затянулись быстрее, чем  я ожидал
//                             ^^^^^^^^^^^^^^^^^^^^^
pattern Обст
{
 adv=ГруппаСрНареч2 : export { node:root_node }
 comma1=','
 conj=союз:чем{}
 p=ПридаточноеВОбороте
 @noshift(ПравыйОграничительОборота)
 comma2=@coalesce(',')
}
: links
{
 adv.<PUNCTUATION>comma1.
      <SUBORDINATE_CLAUSE>conj.
       <NEXT_COLLOCATION_ITEM>p.
        ~<PUNCTUATION>comma2
}
: ngrams { 5 }

// Гул всё более и более утихал.
//     ^^^^^^^^^^^^^^^^^
pattern Обст
{
 p=частица:всё{}
 a1=наречие:*{СТЕПЕНЬ:СРАВН} : export { node:root_node }
 conj=союз:и{}
 a2=наречие:*{СТЕПЕНЬ:СРАВН}
} : links
{
 a1.{
     <PREFIX_PARTICLE>p
     <RIGHT_LOGIC_ITEM>conj.<NEXT_COLLOCATION_ITEM>a2
    }
}
: ngrams { 5 }

// мы стали карабкаться все вверх  и вверх
//                      ^^^^^^^^^^^^^^^^^^
pattern Обст
{
 p=частица:всё{}
 a1=наречие:*{СТЕПЕНЬ:АТРИБ} : export { node:root_node }
 conj=союз:и{}
 a2=наречие:*{СТЕПЕНЬ:АТРИБ}
} : links
{
 a1.{
     <PREFIX_PARTICLE>p
     <RIGHT_LOGIC_ITEM>conj.<NEXT_COLLOCATION_ITEM>a2
    }
}
: ngrams { 5 }


// Придаточное в роли обстоятельства способа
// Аккордеон, чтобы не давил Толе на грудь, мы поставили рядом с его головой.
//          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
pattern Обст
{
 comma1=','
 conj1=СоюзЧтобы : export { node:root_node }
 p=ПридаточноеВОбороте
 @noshift(ПравыйОграничительОборота)
 comma2=@coalesce(',')
}
: links
{
 conj1.{
        <PUNCTUATION>comma1
        <SUBORDINATE_CLAUSE>p
        ~<PUNCTUATION>comma2
       }
}

wordentry_set СопоставитНаречие=наречие:{ как, словно, "как будто" }

// Обособленное дополнение/сопоставление будем рассматривать как обятостельство:
// слонёнок ему хобот протянул, как руку.
//                            ^^^^^^^^^^
pattern Обст
{
 comma1=','
 comp=ГруппаНареч1{СопоставитНаречие} : export { node:root_node }
 n=ГлДополнение
 @noshift(ПравыйОграничительОборота)
 comma2=@coalesce(',')
}
: links
{
 comp.{
        <PUNCTUATION>comma1
        <OBJECT>n
        ~<PUNCTUATION>comma2
       }
}
: ngrams { -5 }


// ----------------------------------


// Сопоставительный оборот КАК+сущ:
// Пристрелю как мародёра
//           ^^^^^^^^^^^^
// Он выглядит очень глупо, как дурак.
pattern ОбстФраза0
{
 a=наречие:как{} : export{ node:root_node }
 n=ГруппаСущ4{ ~ПАДЕЖ:ИМ ~ПАДЕЖ:ПРЕДЛ }
}
: links { a.<OBJECT>n }
: ngrams { -2 }


// там, где жизнь легка и приятна
pattern ОбстФраза0
{
 a1=наречие:там{} : export { node:root_node }
 comma=','
 a2=наречие:где{}
 p=Предикат
} : links
{
 a1.
  <SUBORDINATE_CLAUSE>comma.
   <NEXT_COLLOCATION_ITEM>a2.
    <NEXT_COLLOCATION_ITEM>p
}
: ngrams { 2 }


// Цель игры состоит в том, чтобы получить как можно больше очков
pattern ОбстФраза0
{
 prep=предлог:в{} : export { node:root_node }
 n=местоим_сущ:то{ падеж:предл }
 comma=','
 conj=союз:чтобы{}
 inf=Инф2
} : links
{
 prep.<OBJECT>n.
       <NEXT_COLLOCATION_ITEM>comma.
        <NEXT_COLLOCATION_ITEM>conj.
         <INFINITIVE>inf
        
}
: ngrams { 2 }


wordentry_set КакойПрилаг = { прилагательное:какой{} }

// Разговорный оборот, синонимичный "зачем/почему":
// КАКОГО ДЬЯВОЛА/КАКОГО ЛЕШЕГО/КАКОГО ХРЕНА/...
//
// какого дьявола мы сюда попали?
// ^^^^^^^^^^^^^^
pattern ОбстФраза0
{
 a=ГруппаПрил1{ КакойПрилаг ПАДЕЖ:РОД ЧИСЛО:ЕД }
 n=Сущ0{ =a:РОД ЧИСЛО:ЕД ПАДЕЖ:РОД } : export { node:root_node }
}
: links { n.<ATTRIBUTE>a }
: ngrams { -5 }


// ----------------------------------


// ----------------------------------------------------------
// ОБСТОЯТЕЛЬСТВЕННЫЙ ОБОРОТ - ПРЕДЛОЖНЫЙ ПАТТЕРН + НАРЕЧИЕ
// ----------------------------------------------------------

// Головной элемент, находящийся на левом конце цепочки. С него начинается
// разбор союзного паттерна.
patterns ОбстГолова export { node:root_node KEYFEATURE_REQUIRED }

pattern ОбстГолова
{
 ГруппаНареч2 : export { node:root_node KEYFEATURE_REQUIRED:0 }
}

pattern ОбстГолова
{
 ГруппаСрНареч2 : export { node:root_node KEYFEATURE_REQUIRED:0 }
}

pattern ОбстГолова
{
 ПредлогИСущ : export { node:root_node KEYFEATURE_REQUIRED:1 }
} : ngrams { -2 }

// Существительное в творительном падеже может быть
// обстоятельством способа:
// Добраться автобусом и на самолете
//           ^^^^^^^^^
pattern ОбстГолова
{
 ГруппаСущ4{ ПАДЕЖ:ТВОР ОДУШ:НЕОДУШ } : export { node:root_node KEYFEATURE_REQUIRED:0 }
} : ngrams { -3 }

// Деепричастный оборот выступает в роли приглагольного обстоятельства
// Бежать не быстро, но еле переставляя ноги.
//                      ^^^^^^^^^^^^^^^^^^^^
// повалявшись в снегу, бежать обратно в тепло
pattern ОбстГолова
{
 ДеепрОборотПеред:export { node:root_node KEYFEATURE_REQUIRED:0 }
}

// бежать, повалявшись в снегу, обратно в тепло
pattern ОбстГолова
{
 ДеепрОборот:export { node:root_node KEYFEATURE_REQUIRED:0 }
}

pattern ОбстГолова
{
 ОбстФраза0:export { node:root_node KEYFEATURE_REQUIRED:0 }
}

// -----------------------------------

// Присоединяемые справа элементы.
patterns Обст0 export { node:root_node }

pattern Обст0
{
 ГруппаНареч2{ ~НеМожетМодифГлаг } : export { node:root_node }
}


// Костыль для принудительного разбора конструкций с модификатором.
// В некоторых случаях модификатор может оторваться от модифицируемого
// наречия, и мы пытаемся препятствовать этому посредством поощрения
// в этом правиле:
//
// стрелял быстро, но достаточно точно
//                    ^^^^^^^^^^^^^^^^
pattern Обст0
{
 mod=МодифНареч
 adv=ГруппаНареч1{ ~НеМожетМодифГлаг } : export { node:root_node }
}
: links { adv.<ATTRIBUTE>mod }
: ngrams { 3 }


pattern Обст0
{
 ГруппаСрНареч2{ ~НеМожетМодифГлаг } : export { node:root_node }
}

pattern Обст0
{
 ПредлогИСущ : export { node:root_node }
}

// Существительное в творительном падеже может быть
// обстоятельством способа:
// Добраться автобусом и на самолете
//           ^^^^^^^^^
pattern Обст0
{
 ГруппаСущ4{ ПАДЕЖ:ТВОР ОДУШ:НЕОДУШ } : export { node:root_node }
} : ngrams { -3 }

// Деепричастный оборот выступает в роли приглагольного обстоятельства:
//
// повалявшись в снегу, бежать обратно в тепло
// ^^^^^^^^^^^^^^^^^^^^
pattern Обст0
{
 ДеепрОборотПеред:export { node:root_node }
}

// Бежать не быстро, но еле переставляя ноги.
//                      ^^^^^^^^^^^^^^^^^^^^
// бежать, повалявшись в снегу, обратно в тепло
//       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
pattern Обст0
{
 ДеепрОборот:export { node:root_node }
}

pattern Обст0
{
 ОбстФраза0:export { node:root_node }
}



// +++++++++++++++++++++++++++++++++++++

// ---------------------------------------------------------

patterns ОбстФразаВосх { bottomup } export { node:root_node KEYFEATURE_REQUIRED }

pattern ОбстФразаВосх
{
 adv=ОбстГолова : export { node:root_node KEYFEATURE_REQUIRED }
}


// В приёмной, перед кабинетом, было много мальчиков и девочек.
// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// Она  смотрела  на  меня  строго,  с упреком.
//                          ^^^^^^^^^^^^^^^^^^
pattern ОбстФразаВосх
{
 adv=ОбстФразаВосх : export { node:root_node KEYFEATURE_REQUIRED:0 }
 comma=','
 pn=Обст0
 @noshift(ПравыйОграничительОборота)
 comma2=@coalesce(',')
} : links
{
 adv.<RIGHT_LOGIC_ITEM>comma.
       <NEXT_COLLOCATION_ITEM>pn.
        ~<PUNCTUATION>comma2
}

// Она одевалась просто, но со вкусом.
//               ^^^^^^^^^^^^^^^^^^^^^
pattern ОбстФразаВосх
{
 adv=ОбстФразаВосх : export { node:root_node KEYFEATURE_REQUIRED:0 }
 comma=','
 conj=СоединитОбст
 pn=Обст0
} : links
{
 adv.<RIGHT_LOGIC_ITEM>comma.
      <NEXT_COLLOCATION_ITEM>conj.
       <NEXT_COLLOCATION_ITEM>pn
}


// он повернул вправо, т.е. к реке
pattern ОбстФразаВосх
{
 adv=ОбстФразаВосх : export { node:root_node KEYFEATURE_REQUIRED:0 }
 comma=','
 conj=ЛогичСоюз
 pn=Обст0
} : links
{
 adv.<RIGHT_LOGIC_ITEM>comma.
      <NEXT_COLLOCATION_ITEM>conj.
       <NEXT_COLLOCATION_ITEM>pn
}


// Ты можешь лечь спать во дворе или дома
//                      ^^^^^^^^^^^^^^^^^
pattern ОбстФразаВосх
{
 adv=ОбстФразаВосх : export { node:root_node KEYFEATURE_REQUIRED:0 }
 conj=ЛогичСоюз
 pn=Обст0
} : links
{
 adv.<RIGHT_LOGIC_ITEM>conj.
      <NEXT_COLLOCATION_ITEM>pn
}







collocation_set СоединГрНареч1 =
{
 { хотя в то же время и }, // быстро, хотя в то же время и аккуратно
 { хотя в то же время }, // быстро, хотя в то же время аккуратно
 { хотя в это же время и }, // быстро, хотя в это же время и аккуратно
 { хотя с другой стороны }, // быстро, хотя с другой стороны аккуратно
 { хотя с другой стороны и }, // быстро, хотя с другой стороны и аккуратно
 { пусть и }, // быстро, пусть и аккуратно
 { но в то же время }, // быстро, но в то же время аккуратно
 { но в это же время }, // быстро, но в это же время аккуратно
 { но в то же самое время }, // быстро, но в то же самое время аккуратно
 { но в это же самое время }, // быстро, но в это же самое время аккуратно
 { но вдобавок к этому }, // быстро, но вдобавок к этому аккуратно
 { но вдобавок к этому и }, // быстро, но вдобавок к этому и аккуратно
 { но вдобавок к этому еще и }, // быстро, но вдобавок к этому еще и аккуратно
 { да к тому же }, // быстро, да к тому же аккуратно
 { да к тому же еще и }, // быстро, да к тому же еще и аккуратно
 { но и }, // быстро, но и аккуратно
 { но еще и }, // быстро, но еще и аккуратно
 { да плюс к этому }, // быстро, да плюс к этому аккуратно
 { но плюс к этому }, // быстро, но плюс к этому аккуратно
 { и плюс к этому }, // быстро, и плюс к этому аккуратно
 { и еще }, // быстро, и еще аккуратно
 { да еще }, // быстро, да еще аккуратно
 { ну быстро еще }, // быстро, ну быстро еще аккуратно
// { да еще и }, // быстро, да еще и аккуратно
 { ну еще и }, // быстро, ну еще и аккуратно
 { и плюс к этому еще и }, // быстро, и плюс к этому еще и аккуратно
 { да плюс к этому еще и }, // быстро, да плюс к этому еще и аккуратно
 { ну плюс к этому еще и }, // быстро, ну плюс к этому еще и аккуратно
 { ну и плюс к этому еще и }, // быстро, ну и плюс к этому еще и аккуратно
 { ну да плюс к этому еще и }, // быстро, ну да плюс к этому еще и аккуратно
 { и плюс к этому еще }, // быстро, и плюс к этому еще аккуратно
 { да плюс к этому еще }, // быстро, да плюс к этому еще аккуратно
 { ну плюс к этому еще }, // быстро, ну плюс к этому еще аккуратно
 { ну и плюс к этому еще }, // быстро, ну и плюс к этому еще аккуратно
 { ну да плюс к этому еще }, // быстро, ну да плюс к этому еще аккуратно
 { но к тому же }, // быстро, но к тому же аккуратно
 { и к тому же }, // быстро, и к тому же аккуратно
 { ну и к тому же }, // быстро, ну и к тому же аккуратно
 { хотя может быть },
 { хотя иногда может быть },
 { хотя может быть и },
 { хотя иногда может быть и },
 { а иногда },
 { но иногда }
}

pattern ОбстФразаВосх
{
 a1=ОбстФразаВосх : export { node:root_node KEYFEATURE_REQUIRED:0 }
 comma=_запятая
 j=СоединГрНареч1
 a2=Обст0
} : links {
           a1.
            <RIGHT_LOGIC_ITEM>comma.
             <NEXT_COLLOCATION_ITEM>j.
              <NEXT_COLLOCATION_ITEM>a2
          }

// бил быстро, хотя и точно
//     ^^^^^^^^^^^^^^^^^^^^
pattern ОбстФразаВосх
{
 a1=ОбстФразаВосх : export { node:root_node KEYFEATURE_REQUIRED:0 }
 comma=_запятая
 conj1=союз:хотя{}
 conj2=союз:и{} 
 a2=Обст0
} : links { a1.<RIGHT_LOGIC_ITEM>comma.
               <NEXT_COLLOCATION_ITEM>conj1.
               <NEXT_COLLOCATION_ITEM>conj2.
               <NEXT_COLLOCATION_ITEM>a2 }



// ---------------------------------------------------------

patterns ОбстФразаНисх export { node:root_node KEYFEATURE_REQUIRED }

pattern ОбстФразаНисх
{
 ОбстФразаВосх : export { node:root_node KEYFEATURE_REQUIRED }
}


// Вы можете устроиться либо тут, либо во дворе
//                      ^^^^^^^^^^^^^^^^^^^^^^^
pattern ОбстФразаНисх
{
 conj1=ЛогичСоюз2
 p1=ОбстФразаНисх : export { node:root_node KEYFEATURE_REQUIRED:0 }
 comma2=','
 conj2=ЛогичСоюз2
 p2=Обст0
} : links
{
 p1.{
     <PREFIX_CONJUNCTION>conj1
     <RIGHT_LOGIC_ITEM>comma2.<NEXT_COLLOCATION_ITEM>conj2.
      <NEXT_COLLOCATION_ITEM>p2
    }
}
: ngrams { 5 }



// Тетя просит  присутствующих  высказываться  не  только  о  героях  этих  творений, но даже и от их имени.
pattern ОбстФразаНисх
{
 conj1=СочинительныйСоюз1
 adv=ОбстФразаНисх : export { node:root_node KEYFEATURE_REQUIRED:0 }
 comma=','
 conj2=СочинительныйСоюз2
 pn=Обст0
} : links
{
 adv.{
      <PREFIX_CONJUNCTION>conj1
      <RIGHT_LOGIC_ITEM>comma.<NEXT_COLLOCATION_ITEM>conj2.
       <NEXT_COLLOCATION_ITEM>pn
     }
}
: ngrams { 5 }


// Без запятой:
// И вчера и сегодня шёл дождь.
// ^^^^^^^^^^^^^^^^^
pattern ОбстФразаНисх
{
 conj1=СочинительныйСоюз1
 adv=ОбстФразаНисх : export { node:root_node KEYFEATURE_REQUIRED:0 }
 conj2=СочинительныйСоюз2
 pn=Обст0
} : links
{
 adv.{
      <PREFIX_CONJUNCTION>conj1
      <RIGHT_LOGIC_ITEM>conj2.
       <NEXT_COLLOCATION_ITEM>pn
     }
}
: ngrams { 3 }


// Она может отдохнуть как дома, так и на лужайке
//                     ^^^^^^^^^^^^^^^^^^^^^^^^^^
pattern ОбстФразаНисх
{
 conj1=Соедин2Обст1
 adv=ОбстФразаНисх : export { node:root_node KEYFEATURE_REQUIRED:0 }
 comma=','
 conj2=Соедин2Обст2
 pn=Обст0
} : links
{
 adv.{
      <PREFIX_CONJUNCTION>conj1
      <RIGHT_LOGIC_ITEM>comma.
       <NEXT_COLLOCATION_ITEM>conj2.
        <NEXT_COLLOCATION_ITEM>pn
     }
}
: ngrams { 7 }


patterns Предв1ГрНареч1 export { node:root_node }

pattern Предв1ГрНареч1
{
 p=частица:не{}
 a=наречие:только{} : export { node:root_node }
} : links { a.<NEGATION_PARTICLE>p }

pattern Предв1ГрНареч1
{
 p=частица:не{}
 a=наречие:просто{} : export { node:root_node }
} : links { a.<NEGATION_PARTICLE>p }

collocation_set Соед1ГрНареч1 =
{
 { но и },
 { но еще и },
 { но вдобавок и },
 { но вдобавок еще и },
 { но плюс к этому },
 { но плюс к этому и },
 { но плюс к этому еще и },
 { но вдобавок к этому },
 { но вдобавок к этому и },
 { но вдобавок к этому еще и },
 { но },
 { но к тому же },
 { но к тому же еще и },
}

pattern ОбстФразаНисх
{
 mod1=Предв1ГрНареч1
 a1=ОбстФразаНисх : export { node:root_node KEYFEATURE_REQUIRED:0 }
 comma=_запятая
 mod2=Соед1ГрНареч1
 a2=ОбстФразаНисх
} : links
{
 a1.{
     <ATTRIBUTE>mod1
     <RIGHT_LOGIC_ITEM>comma.
      <NEXT_COLLOCATION_ITEM>a2.
       <ATTRIBUTE>mod2
    }
}


// --------------------------------------------------

pattern Обст
{
 ОбстФразаНисх{ KEYFEATURE_REQUIRED:0 } : export { node:root_node }
}


// предложный паттерн отбит запятыми - обстоятельство:
// Хозяин, при его деловой смекалке, не стал тешить себя пустыми  надеждами.
//       ^^^^^^^^^^^^^^^^^^^^^^^^^^^
pattern Обст
{
 comma1=@coalesce(',')
 adv=ОбстФразаНисх{ KEYFEATURE_REQUIRED:0 } : export { node:root_node }
 @noshift(ПравыйОграничительОборота)
 comma2=@coalesce(',')
}
: links 
{ 
 adv.{
     ~<PUNCTUATION>comma1
     ~<PUNCTUATION>comma2
    }
}
: ngrams { -2 }





// ---------------------------------------------------------


// Есть очень большое количество обстоятельственных конструкций, образуемых
// по образцу:
// мы стали работать рука об  руку.
//                   ^^^^^^^^^^^^^
pattern Обст
{
 n1=существительное:*{ одуш:неодуш падеж:им число:ед } : export { node:root_node }
 prep=предлог:*{}
 n2=существительное:*{ одуш:неодуш =prep:падеж число:ед }
}
: links
{
 n1.<PREPOS_ADJUNCT>prep.<OBJECT>n2
}
: ngrams { -5 }


// Предложное премыкание в составе обстоятельственного сопоставительного
// оборота:
// С ним она часто разговаривала, как со своим стариком
//                              ^^^^^^^^^^^^^^^^^^^^^^^
pattern Обст
{
 comma1=@optional(',')
 conj=СопоставСоюз : export { node:root_node }
 pn=ПредлогИСущ
 @noshift(ПравыйОграничительОборота)
 comma2=@coalesce(',')
}
: links
{
 conj.{
        ~<PUNCTUATION>comma1
        <PREPOS_ADJUNCT>pn
        ~<PUNCTUATION>comma2
       }
}
: ngrams { 5 }

// ++++++++++++++++++++++++++++++++++++

// Ни разу он не поднялся на мой зов
// ^^^^^^^
pattern Обст
{
 p=частица:ни{}
 n=существительное:раз{ падеж:парт } : export { node:root_node }
} : links { n.<PREFIX_PARTICLE>p }

// ++++++++++++++++++++++++++++++++++++++

/*
// предложный паттерн отбит запятыми - обстоятельство:
// Хозяин, при его деловой смекалке, не стал тешить себя пустыми  надеждами.
//       ^^^^^^^^^^^^^^^^^^^^^^^^^^^
pattern Обст
{
 comma1=','
 pn=ПредлогИСущ : export { node:root_node }
 @noshift(ПравыйОграничительОборота)
 comma2=@coalesce(',')
}
: links 
{ 
 pn.{
     <PUNCTUATION>comma1
     ~<PUNCTUATION>comma2
    }
}
: ngrams { -2 }
*/


// они разбежались кто куда
//                 ^^^^^^^^
wordentry_set ПравАтрибКто=наречие:{ куда, как, где }
pattern Обст
{
 n=местоим_сущ:кто{ падеж:им } : export { node:root_node }
 adv=ПравАтрибКто
}
: links { n.<ATTRIBUTE>adv }
: ngrams { -1 }


// попали   внутрь   прежде,   чем   успели активироваться ловушки Властелина.
//                   ^^^^^^^^^^^^^
pattern Обст
{
 conj1=наречие:прежде{} : export { node:root_node }
 comma=','
 conj2=союз:чем{}
 p=ПридаточноеВОбороте
 @noshift(ПравыйОграничительОборота)
 comma2=@coalesce(',')
}
: links
{
 conj1.<SUBORDINATE_CLAUSE>comma.
        <NEXT_COLLOCATION_ITEM>conj2.
         <NEXT_COLLOCATION_ITEM>p.
          ~<PUNCTUATION>comma2
}
: ngrams { 5 }

// ++++++++++++++++++++++++++++++++++++++++++++

collocation_set ОбстСпособа=
{
 "раз за разом", // раз за разом это получалось у него все лучше
 "много позже", // они появились много позже
 "как нельзя вовремя", // вы прибыли как нельзя вовремя.
 "как нельзя кстати", // ты заметила ее как нельзя кстати
 "как нельзя лучше", // зато мне это известно как нельзя лучше
 "тем более", // люди спят тем более.
 "рука об руку", // они работали рука об руку.
 "нос к носу", // они буквально столкнулись нос к носу.
 "плечом к плечу", // мы уже шли плечом к плечу. (ПЛЕЧОМ К ПЛЕЧУ)
 "нога к ноге", // теперь они стояли нога к ноге. (НОГА К НОГЕ)
 "из рук вон плохо" // все шло из рук вон плохо.
}

pattern Обст
{
 ОбстСпособа : export { node:root_node }
} : ngrams { 1 }



// ++++++++++++++++++++++++++++++++++++++++++++

// Частица ЭТО может встречаться в любой позиции:
// неужели это оно привело тебя сюда?
// неужели это горит вода?
// неужели это ему принадлежал голос?
pattern Обст
{
 ЭтоКакЧастица : export { node:root_node }
} : ngrams { -10 }


// -----------------------------------

// Ценой огромных потерь властители обезвредили созданных ими существ.
// ^^^^^^^^^^^^^^^^^^^^^
pattern Обст
{
 n='ценой' : export { node:root_node }
 n2=ГруппаСущ4{ ПАДЕЖ:РОД }
}
: links { n.<RIGHT_GENITIVE_OBJECT>n2 }
: ngrams { -2 }

// ---------------------------------------------------

// неодуш сущ в ТВОР.П. - как обстоятельство способа,
// когда глагол не имеет соотв. валентности:
//
// Костюм сидит на нём мешком
//                     ^^^^^^
pattern Обст
{
 ГруппаСущ4{ ПАДЕЖ:ТВОР ОДУШ:НЕОДУШ } : export { node:root_node }
} : ngrams { -10 }

// А также спорный случай - одушевленное существительное, с семантикой "в качестве":
// Я летел с ним воздушным стрелком.
//               ^^^^^^^^^^^^^^^^^^
pattern Обст
{
 ГруппаСущ4{ ПАДЕЖ:ТВОР ОДУШ:ОДУШ } : export { node:root_node }
} : ngrams { -11 }


// ----------------------------------------

wordentry_set ОдинЗа_Прил = прилагательное:{ один, другой }

// обстоятельство способа ОДИН ЗА ДРУГИМ
// Одно за другим покатились слова
// ^^^^^^^^^^^^^^
pattern Обст
{
 a1=прилагательное:один{} : export { node:root_node }
 p=предлог:за{}
 a2=ОдинЗа_Прил{ ПАДЕЖ:ТВОР =a1:РОД }
}
: links { a1.<PREPOS_ADJUNCT>p.<OBJECT>a2 }
: ngrams { 5 }


// -----------------------------------------

// расширяемый обстоятельственный оборот "В ЧЕСТЬ":
// я танцую в его честь
//          ^^^^^^^^^^^

wordentry_set СущВОбст=существительное:{ честь }
pattern Обст
{
 prep=предлог:в{} : export { node:root_node }
 n2=СущВОбст{ число:ед падеж:предл }
}
: links { prep.<OBJECT>n2 }
: ngrams { 1 }

// -----------------------------------------

// Обстоятельственные обороты "как/когда" с существительным РАЗ:

wordentry_set СущКакОбстСпособа=существительное:{ раз, разик, разок, разочек }

// Иной раз она бывала  грустна и несчастна
// ^^^^^^^^
pattern Обст
{
 n=ГруппаСущ1{ СущКакОбстСпособа ПАДЕЖ:ВИН ЧИСЛО:ЕД } : export { node:root_node }
}
: ngrams
{
 -4
 СущКакОбстВремени(n)
}

// ------------------------------------------

wordentry_set СрединитДляОбстПридаточн=
{
 союз:чтобы{},
 союз:чтоб{},
 союз:что{}
}

// Устойчивая синтаксическая конструкция ТАК, ЧТОБЫ ....
// Мы хотим, чтобы ТАК и ЧТОБЫ не рассыпались на отдельные ветки у сказуемого,
// а были собраны в одной ветке. Поэтому нам нужно отдельное правило с бустером:
//
// Он лег так, чтобы быстро уснуть
//        ^^^^^^^^^^^^^^^^^^^^^^^^
pattern Обст
{
 head=наречие:так{} : export { node:root_node }
 comma=','
 conj=СрединитДляОбстПридаточн
 p=ПридаточноеВОбороте
}
: links
{
 head.<SUBORDINATE_CLAUSE>comma.
       <NEXT_COLLOCATION_ITEM>conj.
        <NEXT_COLLOCATION_ITEM>p
}
: ngrams
{
 2
}




// ------------------------------------------


// для исключения бесконечной рекурсии, некоторые обстоятельственные
// обороты глагольного сказуемого оформляем как отдельный нетерминал.
//patterns ОбстГлагСказ { node:root_node }

pattern ОбстГлагСказ
{
 Обст : export { node:root_node }
}

/*
// будь у меня время, я поверила бы и в призрачную  лестницу.
// ^^^^^^^^^^^^^^^^^^
// Коля бы обязательно почувствовал волшебство, будь оно спрятано там, внутри.
//                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
pattern ОбстГлагСказ
{
 comma1=@optional(',')
 v=ГлИмпСДоп{ ГлаголБыть ЧИСЛО:ЕД } : export { node:root_node }
 @noshift(ПравыйОграничительОборота)
 comma2=@coalesce(',')
}
: links
{
 v.{
    ~<PUNCTUATION>comma1
    ~<PUNCTUATION>comma2
   }
}
: ngrams { 2 }
*/

// --------------------------------------------------------------

// Некоторые прилагательные (порядковые числительные) могут выступать в роли
// обстоятельств:
// Первыми насторожились таможенники, так как груз был недостоверно задекларирован.
// ^^^^^^^

pattern ОбстГлагСказ
{
 прилагательное:*{ ТИП_ПРИЛ:ПОРЯДК ПАДЕЖ:ТВОР } : export { node:root_node }
} : ngrams { -5 }


// -------------------------------------------------------------

// Прибыль выросла на четыре процента
//                 ^^^^^^^^^^^^^^^^^^
// Количество сексуальных преступлений против детей возросло в 26 раз.
//                                                           ^^^^^^^^
wordentry_set ПредлДляСравн1=предлог:{ в, на }
pattern ОбстГлагСказ
{
 p=ПредлДляСравн1 : export { node:root_node }
 c=ГруппаЧисл{ ПАДЕЖ:ВИН }
 n=существительное:*{ ПАДЕЖ:РОД ОДУШ:НЕОДУШ }
}
: links { p.<OBJECT>n.<ATTRIBUTE>c }
: ngrams { 8 }


// --------------------------------------------------

// Сопоставительный оборот с КАК.
// Правильно было бы также проверять согласование подлежащего
// с прилагательным.
//
// Их состояние оценивается как удовлетворительное.
//                          ^^^^^^^^^^^^^^^^^^^^^^
// улыбка была почти как настоящая.
//             ^^^^^^^^^^^^^^^^^^^
wordentry_set СопоставительноеКак={ наречие:как{} }
pattern ОбстГлагСказ
{
 head=ГруппаНареч1{ СопоставительноеКак } : export { node:root_node }
 adj=ГруппаПрил2{ ПАДЕЖ:ИМ }
}
: links { head.<NEXT_COLLOCATION_ITEM>adj }
: ngrams { -6 }

// ------------------------------------------------
// Счетное слово ВСЕГО может модифицировать глагол, когда
// в предложении также есть числительное-объект. Но мы поступим проще,
// без проверки на числительное.
pattern ОбстГлагСказ
{
 наречие:всего{} : export { node:root_node }
}
: ngrams { -5 }



// ---------------------------------------------------------


// Тебе что, плохо живется?
//      ^^^^
pattern ЛевАтрибутСказуем
{
 p=наречие:что{} : export { node:root_node }
 comma=','
} : links { p.<PUNCTUATION>comma }


// -------------------------------------------------------------------





/*
 pattern ГруппаСрНареч2
 {
  ГруппаСрНареч1 : export { node:root_node }
 }
*/

/*
 // быстрее и точнее
 pattern ГруппаСрНареч2
 {
  a1=ГруппаСрНареч1 : export { node:root_node }
  conj=ЛогичСоюз
  a2=ГруппаСрНареч1
 }
 : links { a1.<RIGHT_LOGIC_ITEM>conj.<NEXT_COLLOCATION_ITEM>a2 }
 : ngrams { 2 }

 // быстрее и не очень точно
 pattern ГруппаСрНареч2
 {
  a1=ГруппаСрНареч1 : export { node:root_node }
  conj=союз:и{}
  a2=ГруппаНареч1
 } : links { a1.<RIGHT_LOGIC_ITEM>conj.<NEXT_COLLOCATION_ITEM>a2 }

 // слегка быстрее, но шумно
 pattern ГруппаСрНареч2
 {
  a1=ГруппаСрНареч1 : export { node:root_node }
  comma=_запятая
  conj=союз:но{}
  a2=ГруппаНареч1
 } : links { a1.<RIGHT_LOGIC_ITEM>comma.<NEXT_COLLOCATION_ITEM>conj.<NEXT_COLLOCATION_ITEM>a2 }

 // слегка быстрее, но дороже
 pattern ГруппаСрНареч2
 {
  a1=ГруппаСрНареч1 : export { node:root_node }
  comma=_запятая
  conj=союз:но{}
  a2=ГруппаСрНареч1
 }
 : links { a1.<RIGHT_LOGIC_ITEM>comma.<NEXT_COLLOCATION_ITEM>conj.<NEXT_COLLOCATION_ITEM>a2 }
 : ngrams { 1 }

 // быстрее, выше, сильнее
 pattern ГруппаСрНареч2
 {
  a1=ГруппаСрНареч1 : export { node:root_node }
  comma1=_запятая
  a2=ГруппаСрНареч1
  comma2=_запятая
  a3=ГруппаСрНареч1
 } : links {
            a1.
             <RIGHT_LOGIC_ITEM>comma1.
              <NEXT_COLLOCATION_ITEM>a2.
               <RIGHT_LOGIC_ITEM>comma2.
                <NEXT_COLLOCATION_ITEM>a3
           }
 : ngrams { 2 }

 // быстрее, выше и сильнее
 pattern ГруппаСрНареч2
 {
  a1=ГруппаСрНареч1 : export { node:root_node }
  comma=_запятая
  a2=ГруппаСрНареч1
  conj=ЛогичСоюз
  a3=ГруппаСрНареч1
 } : links {
            a1.
             <RIGHT_LOGIC_ITEM>comma.
              <NEXT_COLLOCATION_ITEM>a2.
               <RIGHT_LOGIC_ITEM>conj.
                <NEXT_COLLOCATION_ITEM>a3
           }
 : ngrams { 3 }

 // быстрее, выше, хотя и сильнее
 pattern ГруппаСрНареч2
 {
  a1=ГруппаСрНареч1 : export { node:root_node }
  comma1=_запятая
  a2=ГруппаСрНареч1
  comma2=_запятая
  conj1=союз:хотя{}
  conj2=союз:и{}
  a3=ГруппаСрНареч1
 } : links {
  a1.
   <RIGHT_LOGIC_ITEM>comma1.
    <NEXT_COLLOCATION_ITEM>a2.
     <RIGHT_LOGIC_ITEM>comma2.
      <NEXT_COLLOCATION_ITEM>conj1.
       <NEXT_COLLOCATION_ITEM>conj2.
        <NEXT_COLLOCATION_ITEM>a3
 }
 : ngrams { 3 }

 // иногда быстро, временами чуть быстрее
 pattern ГруппаНареч2
 {
  mod1=ПремодифНареч
  a1=ГруппаНареч1 : export { node:root_node }
  comma=_запятая
  mod2=ПремодифНареч
  a2=ГруппаСрНареч1
 } : links {
            a1.{
                <ATTRIBUTE>mod1
                <RIGHT_LOGIC_ITEM>comma.
                 <NEXT_COLLOCATION_ITEM>a2.
                  <ATTRIBUTE>mod2
               } }
 : ngrams { 3 }

 // не только быстрее, но и намного дешевле
 pattern ГруппаНареч2
 {
  n=частица:не{}
  mod1=наречие:только{}
  a1=ГруппаСрНареч1 : export { node:root_node }
  comma=_запятая
  conj1=союз:но{}
  conj2=союз:и{}
  a2=ГруппаСрНареч1
 } : links {
            a1.{
                <ATTRIBUTE>mod1.<NEGATION_PARTICLE>n
                <RIGHT_LOGIC_ITEM>comma.
                 <NEXT_COLLOCATION_ITEM>conj1.
                  <NEXT_COLLOCATION_ITEM>conj2.
                   <NEXT_COLLOCATION_ITEM>a2
               }
           }
 : ngrams { 3 }

 // то быстро, то медленнее
 pattern ГруппаНареч2
 {
  conj1=союз:то{}
  a1=ГруппаНареч1 : export { node:root_node }
  comma=_запятая
  conj2=союз:то{}
  a2=ГруппаСрНареч1
 } : links {
            a1.{
                <PREFIX_CONJUNCTION>conj1
                <RIGHT_LOGIC_ITEM>comma.
                 <NEXT_COLLOCATION_ITEM>conj2.
                  <NEXT_COLLOCATION_ITEM>a2
               }
           }
 : ngrams { 3 }

 // то быстрее, то медленнее
 pattern ГруппаСрНареч2
 {
  conj1=союз:то{}
  a1=ГруппаСрНареч1 : export { node:root_node }
  comma=_запятая
  conj2=союз:то{}
  a2=ГруппаСрНареч1
 } : links {
            a1.{
                <PREFIX_CONJUNCTION>conj1
                <RIGHT_LOGIC_ITEM>comma.
                 <NEXT_COLLOCATION_ITEM>conj2.
                  <NEXT_COLLOCATION_ITEM>a2
               }
           }
 : ngrams { 3 }

 // и быстрее, и медленнее
 pattern ГруппаСрНареч2
 {
  conj1=союз:и{}
  a1=ГруппаСрНареч1 : export { node:root_node }
  comma=_запятая
  conj2=союз:и{}
  a2=ГруппаСрНареч1
 } : links {
            a1.{
                <PREFIX_CONJUNCTION>conj1
                <RIGHT_LOGIC_ITEM>comma.
                 <NEXT_COLLOCATION_ITEM>conj2.
                  <NEXT_COLLOCATION_ITEM>a2
               }
           }
 : ngrams { 3 }

 // или быстрее, или медленнее
 pattern ГруппаСрНареч2
 {
  conj1=союз:или{}
  a1=ГруппаСрНареч1 : export { node:root_node }
  comma=_запятая
  conj2=союз:или{}
  a2=ГруппаСрНареч1
 } : links {
            a1.{
                <PREFIX_CONJUNCTION>conj1
                <RIGHT_LOGIC_ITEM>comma.
                 <NEXT_COLLOCATION_ITEM>conj2.
                  <NEXT_COLLOCATION_ITEM>a2
               }
           }
 : ngrams { 3 }

 // либо быстрее, либо медленнее
 pattern ГруппаСрНареч2
 {
  conj1=союз:либо{}
  a1=ГруппаСрНареч1 : export { node:root_node }
  comma=_запятая
  conj2=союз:либо{}
  a2=ГруппаСрНареч1
 } : links {
            a1.{
                <PREFIX_CONJUNCTION>conj1
                <RIGHT_LOGIC_ITEM>comma.
                 <NEXT_COLLOCATION_ITEM>conj2.
                  <NEXT_COLLOCATION_ITEM>a2
               }
           }
 : ngrams { 3 }

 // быстрее, да еще и дешевле
 pattern ГруппаСрНареч2
 {
  a1=ГруппаСрНареч1 : export { node:root_node }
  comma=_запятая
  conj1=союз:да{}
  conj2=наречие:еще{}
  conj3=союз:и{}
  a2=ГруппаСрНареч1
 } : links {
            a1.
             <RIGHT_LOGIC_ITEM>comma.
              <NEXT_COLLOCATION_ITEM>conj1.
               <NEXT_COLLOCATION_ITEM>conj2.
                <NEXT_COLLOCATION_ITEM>conj3.
                 <NEXT_COLLOCATION_ITEM>a2
           }
 : ngrams { 3 }
*/


// Двигаться становилось все труднее и труднее.
//                       ^^^^^^^^^^^^^^^^^^^^^
pattern ГруппаСрНареч2
{
 p=частица:всё{}
 a1=ГруппаСрНареч1 : export { node:root_node }
 conj2=союз:и{}
 a2=ГруппаСрНареч1
} : links {
           a1.{
               <PREFIX_PARTICLE>p
               <RIGHT_LOGIC_ITEM>conj2.
                <NEXT_COLLOCATION_ITEM>a2
              }
          }
: ngrams { 1 }



// ---------------------------------------------






// Компаратив наречия может управлять существительным в родительном падеже, примерно как предлог.
// сильнее всего мне сейчас хотелось спать.
// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
pattern ГруппаСрНареч2
{
 a=ГруппаСрНареч1 : export { node:root_node }
 n=РодДополнение{ ~НеПрисоедКомпаратив }
} : links { a.<OBJECT>n }
  : ngrams { -1 }



patterns СравнНаречВосх { bottomup } export { node:root_node }

pattern СравнНаречВосх
{
 adv=ГруппаСрНареч1 : export { node:root_node }
}


pattern СравнНаречВосх
{
 adv=СравнНаречВосх : export { node:root_node }
 comma=','
 pn=ГруппаСрНареч1
 @noshift(ПравыйОграничительОборота)
 comma2=@coalesce(',')
} : links
{
 adv.<RIGHT_LOGIC_ITEM>comma.
       <NEXT_COLLOCATION_ITEM>pn.
        ~<PUNCTUATION>comma2
}

pattern СравнНаречВосх
{
 adv=СравнНаречВосх : export { node:root_node }
 comma=','
 conj=СоединитОбст
 pn=ГруппаСрНареч1
} : links
{
 adv.<RIGHT_LOGIC_ITEM>comma.
      <NEXT_COLLOCATION_ITEM>conj.
       <NEXT_COLLOCATION_ITEM>pn
}


pattern СравнНаречВосх
{
 adv=СравнНаречВосх : export { node:root_node }
 comma=','
 conj=ЛогичСоюз
 pn=ГруппаСрНареч1
} : links
{
 adv.<RIGHT_LOGIC_ITEM>comma.
      <NEXT_COLLOCATION_ITEM>conj.
       <NEXT_COLLOCATION_ITEM>pn
}


pattern СравнНаречВосх
{
 adv=СравнНаречВосх : export { node:root_node }
 conj=ЛогичСоюз
 pn=ГруппаСрНареч1
} : links
{
 adv.<RIGHT_LOGIC_ITEM>conj.
      <NEXT_COLLOCATION_ITEM>pn
}



pattern СравнНаречВосх
{
 a1=СравнНаречВосх : export { node:root_node }
 comma=_запятая
 j=СоединГрНареч1
 a2=ГруппаСрНареч1
} : links {
           a1.
            <RIGHT_LOGIC_ITEM>comma.
             <NEXT_COLLOCATION_ITEM>j.
              <NEXT_COLLOCATION_ITEM>a2
          }


pattern СравнНаречВосх
{
 a1=СравнНаречВосх : export { node:root_node }
 comma=_запятая
 conj1=союз:хотя{}
 conj2=союз:и{} 
 a2=ГруппаСрНареч1
} : links { a1.<RIGHT_LOGIC_ITEM>comma.
               <NEXT_COLLOCATION_ITEM>conj1.
               <NEXT_COLLOCATION_ITEM>conj2.
               <NEXT_COLLOCATION_ITEM>a2 }



// ---------------------------------------------------------

patterns СравнНаречНисх export { node:root_node }

pattern СравнНаречНисх
{
 СравнНаречВосх : export { node:root_node }
}


// Вы можете устроиться либо тут, либо во дворе
//                      ^^^^^^^^^^^^^^^^^^^^^^^
pattern СравнНаречНисх
{
 conj1=ЛогичСоюз2
 p1=СравнНаречНисх : export { node:root_node }
 comma2=','
 conj2=ЛогичСоюз2
 p2=ГруппаСрНареч1
} : links
{
 p1.{
     <PREFIX_CONJUNCTION>conj1
     <RIGHT_LOGIC_ITEM>comma2.<NEXT_COLLOCATION_ITEM>conj2.
      <NEXT_COLLOCATION_ITEM>p2
    }
}
: ngrams { 5 }



pattern СравнНаречНисх
{
 conj1=СочинительныйСоюз1
 adv=СравнНаречНисх : export { node:root_node }
 comma=','
 conj2=СочинительныйСоюз2
 pn=ГруппаСрНареч1
} : links
{
 adv.{
      <PREFIX_CONJUNCTION>conj1
      <RIGHT_LOGIC_ITEM>comma.<NEXT_COLLOCATION_ITEM>conj2.
       <NEXT_COLLOCATION_ITEM>pn
     }
}
: ngrams { 5 }




pattern СравнНаречНисх
{
 conj1=Соедин2Обст1
 adv=СравнНаречНисх : export { node:root_node }
 comma=','
 conj2=Соедин2Обст2
 pn=ГруппаСрНареч1
} : links
{
 adv.{
      <PREFIX_CONJUNCTION>conj1
      <RIGHT_LOGIC_ITEM>comma.
       <NEXT_COLLOCATION_ITEM>conj2.
        <NEXT_COLLOCATION_ITEM>pn
     }
}
: ngrams { 7 }


pattern СравнНаречНисх
{
 mod1=Предв1ГрНареч1
 a1=СравнНаречНисх : export { node:root_node }
 comma=_запятая
 mod2=Соед1ГрНареч1
 a2=СравнНаречНисх
} : links
{
 a1.{
     <ATTRIBUTE>mod1
     <RIGHT_LOGIC_ITEM>comma.
      <NEXT_COLLOCATION_ITEM>a2.
       <ATTRIBUTE>mod2
    }
}


pattern ГруппаСрНареч2
{
 СравнНаречНисх : export { node:root_node }
}


// Паттерн со словами как, будто, как будто, словно
wordentry_set ЭквивалентКакБудто0={
 наречие:как{},
 наречие:будто{},
 наречие:"как будто"{},
 наречие:словно{}
}

pattern ЭквивалентКакБудто
{
 adv=ЭквивалентКакБудто0 : export { node:root_node }
}

// Он упал как будто бы сам собой
//         ^^^^^^^^^^^^
pattern ЭквивалентКакБудто
{
 adv=ЭквивалентКакБудто0 : export { node:root_node }
 p=ЧастицаБы
} : links { adv.<POSTFIX_PARTICLE>p }


// Стеклышко подбрасывало лодки как на ладони
//                              ^^^^^^^^^^^^^
pattern ГруппаНареч2
{
 a1=ЭквивалентКакБудто : export { node:root_node }
 a2=ПредлогИСущ
} : links { a1.<PREPOS_ADJUNCT>a2 }
//  : ngrams { 3 }

// --------------------------------------


wordentry_set ЭквивалентКак={
 наречие:как{},
 наречие:будто{},
 наречие:словно{}
}

// Мой друг играет как опытный игрок
pattern ГруппаНареч2
{
 a=ЭквивалентКак : export { node:root_node }
 n=СущСПредложДоп{ ПАДЕЖ:ИМ }
} : links { a.<OBJECT>n }
//  : ngrams { 1 }


// Обстоятельственный оборот ПО МЕРЕ ТОГО, КАК ...:
// мы сдаем работу по мере того, как тесты успешно завершаются
//                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
pattern Обст
{
 prep=предлог:по{} : export { node:root_node }
 n1='мере'{ падеж:предл }
 n2='того'{ падеж:род }
 comma=',' 
 @noshift(наречие:как{})
 p=ПридаточноеВОбороте
 comma2=@coalesce(',')
}
: ngrams { 5 }
: links
{
 prep.<OBJECT>n1.
  <RIGHT_GENITIVE_OBJECT>n2.
   <SUBORDINATE_CLAUSE>comma.
    <NEXT_COLLOCATION_ITEM>p.
     ~<PUNCTUATION>comma2
}


// Обстоятелственный оборот В РЕЗУЛЬТАТЕ ТОГО, ЧТО:
// Мальчик скончался в результате того, что был оставлен в стоящем на солнцепеке автомобиле на девять часов.
pattern Обст
{
 prep=предлог:в{} : export { node:root_node }
 n1=существительное:*{ падеж:предл }
 n2='того'{ падеж:род }
 comma=',' 
 conj=СоединДляПридаточного
 p=ПридаточноеВОбороте
 comma2=@coalesce(',')
}
: ngrams { 5 }
: links
{
 prep.<OBJECT>n1.
  <RIGHT_GENITIVE_OBJECT>n2.
   <SUBORDINATE_CLAUSE>comma.
    <NEXT_COLLOCATION_ITEM>conj.
     <NEXT_COLLOCATION_ITEM>p.
      ~<PUNCTUATION>comma2
}


