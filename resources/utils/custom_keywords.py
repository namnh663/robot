"""Module creating keywords"""
from robot.api.deco import keyword


@keyword('Create Index List')
def create_index_list(length):
    return list(range(1, length + 1))


@keyword('Create Index Special List')
def create_index_special_list(length):
    return list(range(3, length + 3))


@keyword('Create Ascending List')
def create_ascending_list(original):
    sorted_list = original[:]
    sorted_list.sort()
    return sorted_list


@keyword('Create Descending List')
def create_descending_list(asc_list):
    descending_list = sorted(asc_list, reverse=True)
    return descending_list
