using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System;
using Ink.Runtime;

public class StoryManager : MonoBehaviour
{
    public TextAsset inkJSON;
    public Story story;
    public event Action<Story> OnCreateStory;

    // UI Prefabs
	[SerializeField]
	private Text textbox;
    [SerializeField]
    private Text speakerbox;
	[SerializeField]
	private Button buttonPrefab;

    // Start is called before the first frame update
    void Awake()
    {
        RemoveChoices();
        StartStory();
    }

    public void ShowUI(bool value)
    {
        int children = gameObject.transform.childCount;
        for (int i = children - 1; i >= 0; --i)
        {
            gameObject.transform.GetChild(i).gameObject.SetActive(value);
        }
    }

    public string LoadChunk(string knot)
    {
        story.ChoosePathString(knot);
        return NextChunk();
    }

    void StartStory()
    {
        story = new Story(inkJSON.text);
        if (OnCreateStory != null) OnCreateStory(story);
        RefreshViews();
    }

    Button CreateChoiceView(string text)
    {
        Button choice = Instantiate(buttonPrefab) as Button;
        choice.transform.SetParent(gameObject.transform, false);
        Text choicetext = choice.GetComponentInChildren<Text>();
        choicetext.text = text;
        return choice;
    }

    void FillContentView(string text)
    {
        textbox.text = text;
    }

    string NextChunk()
    {
        string text = "";
        if (story.canContinue)
        {
            text = story.ContinueMaximally();
        }
        Debug.Log(text);
        return text;
    }

    void LoadSpeaker()
    {
        speakerbox.text = (string) story.variablesState["speaker"];
        if (speakerbox.text == "null")
        {
            ShowUI(false);
        }
    }

    void ClearSpeaker()
    {
        speakerbox.text = "";
    }

    void RefreshViews()
    {
        RemoveChoices();
        ClearSpeaker();

        ShowUI(true);
        string text = NextChunk();
        FillContentView(text);
        LoadSpeaker();
        if(story.currentChoices.Count > 0)
        {
            for(int i =0; i < story.currentChoices.Count; i++)
            {
                Choice choice = story.currentChoices[i];
                Button button = CreateChoiceView(choice.text.Trim());
                button.onClick.AddListener(delegate
                    { SelectChoice(choice); }
                );
            }
        }
        else
        {
            Button restart = CreateChoiceView("The End.\n Replay?");
            restart.onClick.AddListener(delegate { StartStory(); });
        }
    }

    // Destroys all of the Systems's Children (Might need to check tags)
    void RemoveChoices()
    {
        int children = gameObject.transform.childCount;
        for (int i = children - 1; i >= 0; --i)
        {
            if (gameObject.transform.GetChild(i).gameObject.tag == "choice")
            {
                GameObject.Destroy(gameObject.transform.GetChild(i).gameObject);
            }
        }
    }

    void SelectChoice(Choice choice)
    {
        story.ChooseChoiceIndex(choice.index);
        RefreshViews();
    }
}
