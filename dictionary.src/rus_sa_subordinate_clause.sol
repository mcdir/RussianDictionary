﻿// ************************************************************
// Обороты с придаточным предикатом, присоединяемый через КАК и
// другими союзами.
// ************************************************************



pattern ПридаточноеВОбороте
{
 СложноПредлож : export { node:root_node }
 @noshift(ПравыйОграничительОборота)
}

/*
pattern ПридаточноеВОбороте
{
 ГлПредикат : export { node:root_node }
 @noshift(ПравыйОграничительОборота)
}


pattern ПридаточноеВОбороте
{
 ПредикатСвязка : export { node:root_node }
 @noshift(ПравыйОграничительОборота)
}

pattern ПридаточноеВОбороте
{
 Сказуемое : export { node:root_node }
 @noshift(ПравыйОграничительОборота)
}
*/

// Вообще говоря, тут не просто инфинитивная группа, а нечто вроде
// безличного предиката:
// Антилопы вновь щипали траву, понимая, что пока бояться нечего.
//                                       ^^^^^^^^^^^^^^^^^^^^^^^
pattern ПридаточноеВОбороте
{
 Инф : export { node:root_node }
 @noshift(ПравыйОграничительОборота)
} : ngrams { -1 }


// Он  воспитывал  мальчика  так же, как был воспитан сам
//                                       ^^^^^^^^^^^^^^^^
pattern ПридаточноеВОбороте
{
 НеполнСвязка : export { node:root_node }
 @noshift(ПравыйОграничительОборота)
}



// +++++++++++++++++++++++++++++++


wordentry_set КтоЧтоПридаточн=местоим_сущ:{ кто, что }
patterns СловоДляПридаточного export { node:root_node }
pattern СловоДляПридаточного
{
 n=КтоЧтоПридаточн : export { node:root_node }
 p=@optional(частица:же{})
} : links { n.~<POSTFIX_PARTICLE>p }

// Я хочу понять, о ком ты говорил
pattern СловоДляПридаточного
{
 prep=предлог:*{} : export { node:root_node }
 n=КтоЧтоПридаточн{ =prep:ПАДЕЖ }
 p=@optional(частица:же{})
} : links { prep.<OBJECT>n.~<POSTFIX_PARTICLE>p }

wordentry_set ПрилагДляПридаточн=прилагательное:{ какой, который, чей }
pattern СловоДляПридаточного
{
 n=ПрилагДляПридаточн : export { node:root_node }
 p=@optional(частица:же{})
} : links { n.~<POSTFIX_PARTICLE>p }


pattern СловоДляПридаточного
{
 prep=предлог:*{} : export { node:root_node }
 n=ПрилагДляПридаточн{ =prep:ПАДЕЖ }
 p=@optional(частица:же{})
} : links { prep.<OBJECT>n.~<POSTFIX_PARTICLE>p }


// Понимать, что ты задумал
//         ^^^^^^^^^^^^^^^^
pattern БессоюзноеПридаточное export{ ПАДЕЖ node:root_node }
{
 comma1=','
 @noshift(СловоДляПридаточного)
 p=ПридаточноеВОбороте : export { node:root_node ПАДЕЖ:ВИН }
 comma2=@coalesce(',')
} : links
{
 p.{
    <PUNCTUATION>comma1
    ~<PUNCTUATION>comma2
   }
}
: ngrams
{
 2
}

// ++++++++++++++++++++++






// Мы не знаем, почему.
//            ^^^^^^^^
pattern БессоюзноеПридаточное
{
 comma=','
 body=ГруппаНареч2 : export { node:root_node ПАДЕЖ:ВИН }
 @noshift(ПравыйОграничительОборота)
}
: links { body.<PUNCTUATION>comma }
: ngrams { -3 }


// Я знаю, для кого.
//       ^^^^^^^^^^
pattern БессоюзноеПридаточное
{
 comma=','
 body=ПредлогИСущ : export { node:root_node ПАДЕЖ:ВИН }
 @noshift(ПравыйОграничительОборота)
}
: links { body.<PUNCTUATION>comma }
: ngrams { -3 }

