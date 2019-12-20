import javax.swing.JOptionPane;


/**
 * Affiche une fenêtre de dialogue demandant de rentrer un entier
 *
 * @param {String} s (optionel) L'optionelle chaîne de caractères à afficher
 *
 * @return {int} Retourne l'entier entré (0 si pas un entier)
 *
 */
int askInteger () {
  int i = 0;
  String r = JOptionPane.showInputDialog(null, "Entrez un entier", "askInteger", JOptionPane.QUESTION_MESSAGE);
  
  try {
    i = Integer.parseInt(r);
  } 
  catch(NumberFormatException e) {
    println("Note: Ce n'est pas un entier!");
  }

  return i;
}

int askInteger (String s) {
  int i = 0;
  String r = JOptionPane.showInputDialog(null,s, "askInteger", JOptionPane.QUESTION_MESSAGE);
  
  try {
    i = Integer.parseInt(r);
  } 
  catch(NumberFormatException e) {
    println("Note: Ce n'est pas un entier!");
  }
  return i;
}


/**
 * Affiche une fenêtre de dialogue demandant de rentrer un réel
 *
 * @param {String} s (optionel) L'optionelle chaîne de caractères à afficher
 *
 * @return {float} Retourne le réel entré (0 si pas un réel)
 *
 */
float askFloat () {
  float i = 0;
  String r = JOptionPane.showInputDialog(null, "Entrez un réel", "askFloat", JOptionPane.QUESTION_MESSAGE);

  try {
    i = Float.parseFloat(r);
  } 
  catch(NumberFormatException e) {
    println("Note: Ce n'est pas un réel!");
  }
  catch(NullPointerException e) {
    println("Note: Aucune valeur entrée.");
  }

  return i;
}

float askFloat (String s) {
  float i = 0;
  String r = JOptionPane.showInputDialog(null, s, "askFloat", JOptionPane.QUESTION_MESSAGE);

  try {
    i = Float.parseFloat(r);
  } 
  catch(NumberFormatException e) {
    println("Note: Ce n'est pas un réel!");
  }
  catch(NullPointerException e) {
    println("Note: Aucune valeur entrée.");
  }

  return i;
}


/**
 * Affiche une fenêtre de dialogue demandant de rentrer un réel (plus précis/grand que askFloat)
 *
 * @param {String} s (optionel)L'optionelle chaîne de caractères à afficher
 *
 * @return {double} Retourne le réel entré (0 si pas un réel)
 *
 */
double askDouble () {
  double i = 0;
  String r = JOptionPane.showInputDialog(null, "Entrez un réel", "askDouble", JOptionPane.QUESTION_MESSAGE);

  try {
    i = Double.parseDouble(r);
  } 
  catch(NumberFormatException e) {
    println("Note: Ce n'est pas un réel!");
  }
  catch(NullPointerException e) {
    println("Note: Aucune valeur entrée.");
  }

  return i;
}

double askDouble (String s) {
  double i = 0;
  String r = JOptionPane.showInputDialog(null, s, "askDouble", JOptionPane.QUESTION_MESSAGE);

  try {
    i = Double.parseDouble(r);
  } 
  catch(NumberFormatException e) {
    println("Note: Ce n'est pas un réel!");
  }
  catch(NullPointerException e) {
    println("Note: Aucune valeur entrée.");
  }

  return i;
}


/**
 * Affiche une fenêtre de dialogue demandant de rentrer un caractère
 *
 * @param {String} s (optionel)L'optionelle chaîne de caractères à afficher
 *
 * @return {char} Retourne le caractère entré (NUL char retouné si pas un caractère (vide))
 *
 */
char askChar () {
  char i = 0;
  String r = JOptionPane.showInputDialog(null, "Entrez un caractère", "askChar", JOptionPane.QUESTION_MESSAGE);

  try {
    i = r.charAt(0);
  } 
  catch(NumberFormatException e) {
    println("Note: Ce n'est pas un caractère!");
  }
  catch(StringIndexOutOfBoundsException e) {
    println("Note: Aucun caractère entré.");
  }

  return i;
}

char askChar (String s) {
  char i = 0;
  String r = JOptionPane.showInputDialog(null, s, "askChar", JOptionPane.QUESTION_MESSAGE);

  try {
    i = r.charAt(0);
  } 
  catch(NumberFormatException e) {
    println("Note: Ce n'est pas un caractère!");
  }
  catch(StringIndexOutOfBoundsException e) {
    println("Note: Aucun caractère entré.");
  }

  return i;
}

/**
 * Affiche une fenêtre de dialogue demandant de rentrer un chaîne de caractère
 *
 * @param {String} s (optionel) L'optionelle chaîne de caractères à afficher
 *
 * @return {String} Retourne la chaîne de caractère entrée (null si aucune n'est rentrée)
 *
 */
String askString () {
  String r = JOptionPane.showInputDialog(null, "Entrez une chaine de caractère", "askString", JOptionPane.QUESTION_MESSAGE);
  return r;
}

String askString (String s) {
  String r = JOptionPane.showInputDialog(null, s, "askString", JOptionPane.QUESTION_MESSAGE);
  return r;
}
