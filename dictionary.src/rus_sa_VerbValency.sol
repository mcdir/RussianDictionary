﻿tree_scorers ВалентностьБессоюзнПридаточн

// Глаголы, которые обычно присоединяют бессоюзное придаточное с ЧТО
// в качестве прямого дополнения
wordentry_set ГлаголыСБессоюзнПридаточн=
{
 rus_verbs:слушать{}, // И слушай, что я говорю.
 rus_verbs:понимать{}, // Ты понимаешь, что говоришь?
 rus_verbs:понять{},
 rus_verbs:подумать{}, // Подумайте, что вы говорите!
 rus_verbs:сказать{}, // Скажите, что мне делать.
 rus_verbs:знать{} // И знаешь, что я думаю?
}

tree_scorer ВалентностьБессоюзнПридаточн language=Russian
{
 if context { ГлаголыСБессоюзнПридаточн }
  then 3
}