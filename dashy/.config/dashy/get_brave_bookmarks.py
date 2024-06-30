import json
import os
from argparse import ArgumentParser  # TODO: for getting brave_profile from command line
from typing import Dict, List

brave_profile = "Default"
bookmarks_filepath = f"$HOME/Library/Application Support/BraveSoftware/Brave-Browser/{brave_profile}/Bookmarks"

bookmarks_dict = json.load(fp=open(os.path.expandvars(bookmarks_filepath), "r"))


def add_section_item(
    raw_section: Dict,
    all_sections: Dict[str, List[Dict[str, str]]],
    raw_section_key_in_all_sections: str,
) -> None:
    if raw_section["type"] == "url":
        all_sections.setdefault(raw_section_key_in_all_sections, []).append(
            {
                dict_key: dict_val
                for dict_key, dict_val in raw_section.items()
                if dict_key in ["name", "url"]
            }
        )

    raw_section_key_in_all_sections = (
        f'{raw_section_key_in_all_sections}/{raw_section["name"]}'
        if raw_section_key_in_all_sections
        else raw_section["name"]
    )
    for child in raw_section.get("children", []):
        add_section_item(
            child,
            all_sections=all_sections,
            raw_section_key_in_all_sections=raw_section_key_in_all_sections,
        )


all_sections: Dict[str, List[Dict[str, str]]] = {}
for key, val in bookmarks_dict["roots"].items():
    add_section_item(
        raw_section=val, all_sections=all_sections, raw_section_key_in_all_sections=""
    )

formatted_sections_for_dashy = {
    "sections": [
        {
            "name": section_name,
            "displayData": {"hideForGuests": True},
            "items": [
                {
                    "title" if section_key == "name" else section_key: section_value
                    for section_key, section_value in section.items()
                }
                for section in section_items
            ],
        }
        for section_name, section_items in all_sections.items()
    ]
}
# JSON -> YAML at https://jsonformatter.org/json-to-yaml
print(json.dumps(formatted_sections_for_dashy, indent=2))
