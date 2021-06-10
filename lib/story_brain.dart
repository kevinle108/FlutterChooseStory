import 'story.dart';

class StoryBrain {
  final Map<String, Story> _storyMap = {
    "start": Story(
        storyTitle:
        "Welcome adventurer. Your adventure begins, as many do, in Ye Olde Inn.",
        choice1: "Continue",
        target1: "inn",
        choice2: "",
        target2: ""),
    "inn": Story(
        storyTitle:
        "This is a peaceful, happy inn with plentiful drink, tasty food, and friendly staff.",
        choice1: "Stay",
        target1: "inn",
        choice2: "Go!",
        target2: "cave entrance"),
    "cave entrance": Story(
        storyTitle: "There is a dark cave in the hillside before you.",
        choice1: "Enter",
        target1: "entry",
        choice2: "Run",
        target2: "inn"),
    "entry": Story(
        storyTitle: "You are in a dark, narrow tunnel.",
        choice1: "Next",
        target1: "side opening",
        choice2: "",
        target2: ""),
    "side opening": Story(
        storyTitle:
        "You are in a small room, one tunnel leads ahead and another to the side. Do you continue on or explore the side tunnel?",
        choice1: "Continue",
        target1: "skeleton room",
        choice2: "Side T.",
        target2: "treasure room"),
    "treasure room": Story(
        storyTitle: "There is a pile of treasure here. Congratulations!",
        choice1: "Next",
        target1: "maze 1",
        choice2: "",
        target2: ""),
    "skeleton room": Story(
        storyTitle:
        "There is a skeleton on the floor. From the items around it, it seems to be that of an unfortunate adventurer.",
        choice1: "Next",
        target1: "maze 2",
        choice2: "",
        target2: ""),
    "maze 1": Story(
        storyTitle: "There are passages to the left and right.",
        choice1: "Left",
        target1: "maze 3",
        choice2: "Right",
        target2: "maze 2"),
    "maze 2": Story(
        storyTitle: "There are passages to the left and right.",
        choice1: "Left",
        target1: "maze 1",
        choice2: "Right",
        target2: "maze 4"),
    "maze 3": Story(
        storyTitle: "There are passages to the left and right.",
        choice1: "Left",
        target1: "maze 5",
        choice2: "Right",
        target2: "maze 2"),
    "maze 4": Story(
        storyTitle: "There are passages to the left and right.",
        choice1: "Left",
        target1: "maze 1",
        choice2: "Right",
        target2: "maze 6"),
    "maze 5": Story(
        storyTitle: "There are passages to the left and right.",
        choice1: "Left",
        target1: "maze 4",
        choice2: "Right",
        target2: "creaking"),
    "maze 6": Story(
        storyTitle: "There are passages to the left and right.",
        choice1: "Left",
        target1: "creaking",
        choice2: "Right",
        target2: "maze 3"),
    "creaking": Story(
        storyTitle: "You hear an ominous creaking from around the corner",
        choice1: "Cont.",
        target1: "bridge room 1",
        choice2: "Go back",
        target2: "inn"),
    "bridge room 1": Story(
        storyTitle:
        "There is a creaking, rickety wooded bridge leading across a gaping chasm.",
        choice1: "Cont.",
        target1: "bridge room 2",
        choice2: "",
        target2: ""),
    "bridge room 2": Story(
      storyTitle:
      "At the other end is a large treasure chest. There is also a short tunnel with daylight at the end.",
      choice1: "Treasure!",
      target1: "die",
      choice2: "Leave",
      target2: "inn",
    ),
    "die": Story(
        storyTitle: "The bridge gives way and you fall to a painful death.",
        choice1: "Next",
        target1: "inn",
        choice2: "",
        target2: "")
  };

  String _currentKey = 'start';

  String getStory() => _storyMap[_currentKey].storyTitle;

  String getChoice1() => _storyMap[_currentKey].choice1;

  String getChoice2() => _storyMap[_currentKey].choice2;

  void restart() => _currentKey = 'start';

  void nextStory(int choiceNumber) {
    print(_storyMap[_currentKey].storyTitle);
    if (_storyMap[_currentKey].target1 == '' &&
        _storyMap[_currentKey].target2 == '') {
      restart();
    } else {
      _currentKey = (choiceNumber == 1)
          ? _storyMap[_currentKey].target1
          : _storyMap[_currentKey].target2;
    }
  }

  bool buttonShouldBeVisible() {
    return _storyMap[_currentKey].target2 != '';
  }
}
