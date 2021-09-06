
/// copy this code below and run in https://dartpad.dev

void main(){
  List<int> input = [10,13,25,30,12,18,5,7];
  List<int> input2 = [9,26,1,14,11,41,6,12];
  for(int i = 0; i< input.length; i++){
    List<int> listShirtNumber = input;
    for(int j=1; j< input.length; j++){
      if(listShirtNumber.reduce((a, b) => a + b) - (listShirtNumber[i]+listShirtNumber[j]) == 100){
        int wolf1 = listShirtNumber[i];
        int wolf2 = listShirtNumber[j];
        listShirtNumber.remove(wolf1);
        listShirtNumber.remove(wolf2);
        print(listShirtNumber);
        break;
      }
    }
    if(listShirtNumber.length == 6){
      break;
    }
  }
}


