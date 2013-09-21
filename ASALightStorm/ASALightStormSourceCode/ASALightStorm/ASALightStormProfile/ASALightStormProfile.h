//
// Created by AndrewShmig on 9/14/13.
//
// Copyright (c) 2013 Andrew Shmig
//
// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without
// restriction, including without limitation the rights to use,
// copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following
// conditions:
//
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
// OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
// FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
#import <Foundation/Foundation.h>


@class CDProfile;

// TODO: write unit tests

/** Класс предназначен для работы с профилями и связанными с профилем объектами 
(фильтрами, закладками, адБлоками и тд).
 
Перед тем, как начать работу с ASALightStorm необходимо создать профиль, либо
войти в уже существующий.
*/
@interface ASALightStormProfile : NSObject

/**
@name Свойства
*/
/** Объект профиля пользователя
 */
@property (nonatomic, readonly) CDProfile *profile;

/**
@name Создание нового профиля
*/
/** Создание профиля(ей)

@param name имя создаваемого профиля
@param password пароль создаваемого профиля
 
@return объект профиля, либо nil, если профиль с таким именем уже существует
*/
+ (id)profileWithName:(NSString *)name
             password:(NSString *)password;

/** Создание профиля с указанным именем. В качестве пароля устанавливается пустая строка.
 
@param name наименование профиля
 
@return объект профиля, либо nil, если профиль с таким именем уже существует
*/
+ (id)profileWithName:(NSString *)name;

/**
@name Вход в профиль(и)
*/
/** Осуществляет вход в профиль с указанным именем и паролем.
 
@param name наименование профиля в который осуществляется вход
@param password пароль профиля в который осуществляется вход
 
@return объект профиля, либо nil, если войти в профиль с таким именем или паролем не удалось
*/
+ (id)logInWithName:(NSString *)name
           password:(NSString *)password;

/**
@name Удаление профиля(ей)
*/
/** Удаляет профиль и все связанные данные с профилем

Профиль будет удалён только в том случае, если наименование профиля и пароль совпадают
с теми данными, которые находятся в БД
 
@param name наименование профиля
@param password пароль указываемого профиля
*/
+ (void)destroyProfileWithName:(NSString *)name
                      password:(NSString *)password;

/** Удаляет профиль с указанным именем. В качестве пароля используется пустая строка.

@param name наименование профиля
*/
+ (void)destroyProfileWithName:(NSString *)name;

/** Удаляет переданный объект профиля и все связанные с ним данные
 
@param profile объект профиля
*/
+ (void)destroyProfile:(ASALightStormProfile *)profile;

/** Удаляет все профили и связанные с ними данные
*/
+ (void)destroyAll;

/** Удаляет профиль, который представлен текущим экземпляром класса ASALightStormProfile
 */
- (void)destroy;

/**
@name Список профилей
*/
/** Список все профилей находящихся в хранилище
 
 @return массив с объектами типа ASALightStormProfile
 */
+ (NSArray *)profiles;

@end