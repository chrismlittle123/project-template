import pytest

from src.sample_script import build_file_path


def test_true_is_true():
    assert True == True


def test_build_file_path():
    assert build_file_path("test.json") == "data/test.json"
