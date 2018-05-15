//
//  main.c
//  Beds
//
//  Created by Sam Meech-Ward on 2018-05-15.
//  Copyright © 2018 meech-ward. All rights reserved.
//

// Bed
// Pillows, Blankets, Mattress
// make itself,

#include <stdio.h>

typedef struct Mattress {
  
} Mattress;

typedef struct Bed {
  int numberOfPillows;
  int numberOfBlankets;
  Mattress mattress;
} Bed;

int newBed(Bed **bed) {
  *bed = malloc(sizeof(Bed));
  //
//  **bed.numberOfPillows = 0;
  // Some error cheks
//  *error = 0;
  return 0;
}

void endBed(Bed *bed) {
  
}

int main(int argc, const char * argv[]) {
  Bed *bed;
  int status = newBed(&bed);
  if (status == 0) {
    // ok
  }
  
  return 0;
}
