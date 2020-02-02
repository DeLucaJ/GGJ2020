using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DoorLock : MonoBehaviour
{
    public bool isLocked = false;
    public StoryManager sm;
    public string lockVariable;

    // Update is called once per frame
    void Update()
    {
        if (isLocked) CheckVariable();
    }
    void CheckVariable()
    {
        if(((int) sm.story.variablesState[lockVariable]) > 0)
        {
            isLocked = false;
        }
    }
}
