%БЗ животных небольшого зоопарка

domains
питомец=питомец(id_животного, имя, дата_рождения, пол, вид, зона_обитания, id_сотрудника)
дата_рождения, дата_улета, дата_прилета =дата(день, месяц, год)
сотрудник=сотрудник(id_сотрудника, фамилия, имя, отчество, дата_рождения, пол, телефон)

id_животного, id_сотрудника, день, месяц, год, количество = integer
имя, наименование, характеристика, фамилия, имя, отчество, телефон = string
пол, продукт, происхождение, группа, тип, страна, вид, зона_обитания = symbol
температура = real

predicates
питомец(id_животного, имя, дата_рождения, пол, вид, зона_обитания, id_сотрудника).

сотрудник(id_сотрудника, фамилия, имя, отчество, дата_рождения, пол, телефон).

clauses
питомец(1, "Гиена", дата(1, 1, 2019), муж, волк, африка, 1).
питомец(2, "Лев", дата(1, 1, 2020), муж, волк, африка, 3).
питомец(3, "Попугай", дата(1, 1, 2021), жен, волк, севАмерика, 2).
питомец(4, "Лисица", дата(1, 1, 2022), жен, волк, евразия, 4).
питомец(5, "Тигр", дата(1, 1, 2023), муж, волк, севАмерика, 5).

сотрудник(1, "Баранов", "Зиновий", "Тихонович", дата(2, 2, 1998), муж, "7(951)812-02-65").
сотрудник(2, "Савин", "Клим", "Вячеславович", дата(2, 4, 2000), муж, "7(951)653-13-97").
сотрудник(3, "Пестова", "Флора", "Дмитрьевна", дата(3, 2, 1990), жен, "7(951)118-91-38").
сотрудник(4, "Копылов", "Артур", "Тарасович", дата(5, 4, 1970), муж, "7(951)709-78-70").
сотрудник(5, "Зуев", "Ермолай", "Ярославович", дата(7, 3, 1960), муж, "7(951)926-28-20").

goal
write("asd").
