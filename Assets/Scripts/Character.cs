using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "NewCharacter", menuName = "Character", order = 0)]

public class Character : ScriptableObject
{
    public string characterName;
    public string sceneName;
    public List<AudioClip> voices;
}
