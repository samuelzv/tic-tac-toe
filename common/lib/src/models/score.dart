class GameScore {
  int human = 0;
  int computer = 0;
  int tied = 0;

  @override
  toString() {
    return 'human:$human, computer:$computer, tied:$tied';
  }
}