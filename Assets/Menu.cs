using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Menu : MonoBehaviour
{
    public void Play()
    {
        Debug.Log("Beginning the Game");
        SceneManager.LoadScene("Primary", LoadSceneMode.Single);
    }

    public void Quit()
    {
        Debug.Log("Quitting the Game");
        Application.Quit();
    }
}
