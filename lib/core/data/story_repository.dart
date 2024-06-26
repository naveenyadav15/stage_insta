import 'package:stage_insta/feature/story/modal/story_model.dart';

class StoryRepository {
  Future<List<Story>> fetchStories() async {
    // Simulating network delay
    await Future.delayed(const Duration(seconds: 2));
    List<String> images = [
      'https://media.istockphoto.com/id/1184166069/photo/golden-cosmos-flower-under-blue-sky-view-at-low-angle.jpg?s=1024x1024&w=is&k=20&c=fmAgvbuhNGTazEySPeoP7_Ku3kYGyj-zmLulSDloBvI=',
      'https://images.unsplash.com/photo-1504803900752-c2051699d0e8?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1494507857635-64401a90e2eb?q=80&w=3000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1529485726363-95c8d62f656f?q=80&w=3474&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1458501534264-7d326fa0ca04?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1458932955922-a397fae0b8d5?q=80&w=3570&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ];

    // Hardcoded list of stories with multiple images
    List<Story> storyList = [];
    int imgLen = images.length;
    for (int i = 1; i <= 10; i++) {
      List<String> imageUrls = [];
      for (int j = 0; j < imgLen; j++) {
        int remainder = (i - 1) % imgLen;
        if ((j % i) == remainder) imageUrls.add(images[j]);
      }
      storyList.add(Story(id: "$i", imageUrls: imageUrls, title: "Story $i"));
    }
    return storyList;
    return [
      Story(
          id: '1',
          imageUrls: [
            'https://www.google.com/imgres?q=single%20people%20images&imgurl=https%3A%2F%2Fwendyspeaks.com%2Fwp-content%2Fuploads%2F2018%2F06%2Frawpixel-658258-unsplash-1024x907.jpg&imgrefurl=https%3A%2F%2Fwendyspeaks.com%2F10-life-changing-habits%2F&docid=KYoKvWU5W6gcpM&tbnid=RbG2roHRp3DUvM&vet=12ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECGUQAA..i&w=1024&h=907&hcb=2&ved=2ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECGUQAA',
            'https://www.google.com/imgres?q=single%20people%20images&imgurl=https%3A%2F%2Fwww.waca.associates%2Fen%2Fwp-content%2Fuploads%2F2021%2F02%2Fhappy-woman-in-nature-at-sunset-860x487.jpg&imgrefurl=https%3A%2F%2Fwww.waca.associates%2Fen%2Fgrowthhacking%2Fkitnever-do-these-things-when-youre-a-single-person%2F&docid=AMiGDYOgUUhVLM&tbnid=FTeoJRmfnXg49M&vet=12ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECFkQAA..i&w=860&h=487&hcb=2&ved=2ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECFkQAA'
          ],
          title: 'Story 1'),
      Story(
          id: '2',
          imageUrls: [
            'https://www.google.com/imgres?q=single%20people%20images&imgurl=https%3A%2F%2Fthumbs.dreamstime.com%2Fb%2Fconfident-black-man-looking-camera-indoors-head-shot-young-handsome-portrait-african-american-single-bachelor-male-standing-128706411.jpg&imgrefurl=https%3A%2F%2Fwww.dreamstime.com%2Fphotos-images%2Fsingle-person.html&docid=slYa8UjhRo-nyM&tbnid=vJSiKCTEkDWrTM&vet=12ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECBsQAA..i&w=800&h=534&hcb=2&ved=2ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECBsQAA',
            'https://www.google.com/imgres?q=single%20people%20images&imgurl=https%3A%2F%2Fcdn2.psychologytoday.com%2Fassets%2Fstyles%2Fmanual_crop_1_91_1_1528x800%2Fpublic%2Ffield_blog_entry_images%2Fshutterstock_193527755.jpg%3Fitok%3DuS1VIBoY&imgrefurl=https%3A%2F%2Fwww.psychologytoday.com%2Fgb%2Fblog%2Fliving-single%2F201305%2Fare-single-people-mentally-stronger&docid=8Eebna8sJvnjDM&tbnid=JZMWHV0peAgXrM&vet=12ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECFoQAA..i&w=1528&h=800&hcb=2&ved=2ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECFoQAA'
          ],
          title: 'Story 2'),
      Story(
          id: '3',
          imageUrls: [
            'https://www.google.com/imgres?q=single%20people%20images&imgurl=https%3A%2F%2Fwendyspeaks.com%2Fwp-content%2Fuploads%2F2018%2F06%2Frawpixel-658258-unsplash-1024x907.jpg&imgrefurl=https%3A%2F%2Fwendyspeaks.com%2F10-life-changing-habits%2F&docid=KYoKvWU5W6gcpM&tbnid=RbG2roHRp3DUvM&vet=12ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECGUQAA..i&w=1024&h=907&hcb=2&ved=2ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECGUQAA',
            'https://www.google.com/imgres?q=single%20people%20images&imgurl=https%3A%2F%2Fwww.waca.associates%2Fen%2Fwp-content%2Fuploads%2F2021%2F02%2Fhappy-woman-in-nature-at-sunset-860x487.jpg&imgrefurl=https%3A%2F%2Fwww.waca.associates%2Fen%2Fgrowthhacking%2Fkitnever-do-these-things-when-youre-a-single-person%2F&docid=AMiGDYOgUUhVLM&tbnid=FTeoJRmfnXg49M&vet=12ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECFkQAA..i&w=860&h=487&hcb=2&ved=2ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECFkQAA'
          ],
          title: 'Story 3'),
      Story(
          id: '4',
          imageUrls: [
            'https://www.google.com/imgres?q=single%20people%20images&imgurl=https%3A%2F%2Fthumbs.dreamstime.com%2Fb%2Fconfident-black-man-looking-camera-indoors-head-shot-young-handsome-portrait-african-american-single-bachelor-male-standing-128706411.jpg&imgrefurl=https%3A%2F%2Fwww.dreamstime.com%2Fphotos-images%2Fsingle-person.html&docid=slYa8UjhRo-nyM&tbnid=vJSiKCTEkDWrTM&vet=12ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECBsQAA..i&w=800&h=534&hcb=2&ved=2ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECBsQAA',
            'https://www.google.com/imgres?q=single%20people%20images&imgurl=https%3A%2F%2Fcdn2.psychologytoday.com%2Fassets%2Fstyles%2Fmanual_crop_1_91_1_1528x800%2Fpublic%2Ffield_blog_entry_images%2Fshutterstock_193527755.jpg%3Fitok%3DuS1VIBoY&imgrefurl=https%3A%2F%2Fwww.psychologytoday.com%2Fgb%2Fblog%2Fliving-single%2F201305%2Fare-single-people-mentally-stronger&docid=8Eebna8sJvnjDM&tbnid=JZMWHV0peAgXrM&vet=12ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECFoQAA..i&w=1528&h=800&hcb=2&ved=2ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECFoQAA'
          ],
          title: 'Story 4'),
      Story(
          id: '5',
          imageUrls: [
            'https://www.google.com/imgres?q=single%20people%20images&imgurl=https%3A%2F%2Fwendyspeaks.com%2Fwp-content%2Fuploads%2F2018%2F06%2Frawpixel-658258-unsplash-1024x907.jpg&imgrefurl=https%3A%2F%2Fwendyspeaks.com%2F10-life-changing-habits%2F&docid=KYoKvWU5W6gcpM&tbnid=RbG2roHRp3DUvM&vet=12ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECGUQAA..i&w=1024&h=907&hcb=2&ved=2ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECGUQAA',
            'https://www.google.com/imgres?q=single%20people%20images&imgurl=https%3A%2F%2Fwww.waca.associates%2Fen%2Fwp-content%2Fuploads%2F2021%2F02%2Fhappy-woman-in-nature-at-sunset-860x487.jpg&imgrefurl=https%3A%2F%2Fwww.waca.associates%2Fen%2Fgrowthhacking%2Fkitnever-do-these-things-when-youre-a-single-person%2F&docid=AMiGDYOgUUhVLM&tbnid=FTeoJRmfnXg49M&vet=12ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECFkQAA..i&w=860&h=487&hcb=2&ved=2ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECFkQAA'
          ],
          title: 'Story 5'),
      Story(
          id: '6',
          imageUrls: [
            'https://www.google.com/imgres?q=single%20people%20images&imgurl=https%3A%2F%2Fthumbs.dreamstime.com%2Fb%2Fconfident-black-man-looking-camera-indoors-head-shot-young-handsome-portrait-african-american-single-bachelor-male-standing-128706411.jpg&imgrefurl=https%3A%2F%2Fwww.dreamstime.com%2Fphotos-images%2Fsingle-person.html&docid=slYa8UjhRo-nyM&tbnid=vJSiKCTEkDWrTM&vet=12ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECBsQAA..i&w=800&h=534&hcb=2&ved=2ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECBsQAA',
            'https://www.google.com/imgres?q=single%20people%20images&imgurl=https%3A%2F%2Fcdn2.psychologytoday.com%2Fassets%2Fstyles%2Fmanual_crop_1_91_1_1528x800%2Fpublic%2Ffield_blog_entry_images%2Fshutterstock_193527755.jpg%3Fitok%3DuS1VIBoY&imgrefurl=https%3A%2F%2Fwww.psychologytoday.com%2Fgb%2Fblog%2Fliving-single%2F201305%2Fare-single-people-mentally-stronger&docid=8Eebna8sJvnjDM&tbnid=JZMWHV0peAgXrM&vet=12ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECFoQAA..i&w=1528&h=800&hcb=2&ved=2ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECFoQAA'
          ],
          title: 'Story 6'),
      Story(
          id: '7',
          imageUrls: [
            'https://www.google.com/imgres?q=single%20people%20images&imgurl=https%3A%2F%2Fwendyspeaks.com%2Fwp-content%2Fuploads%2F2018%2F06%2Frawpixel-658258-unsplash-1024x907.jpg&imgrefurl=https%3A%2F%2Fwendyspeaks.com%2F10-life-changing-habits%2F&docid=KYoKvWU5W6gcpM&tbnid=RbG2roHRp3DUvM&vet=12ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECGUQAA..i&w=1024&h=907&hcb=2&ved=2ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECGUQAA',
            'https://www.google.com/imgres?q=single%20people%20images&imgurl=https%3A%2F%2Fwww.waca.associates%2Fen%2Fwp-content%2Fuploads%2F2021%2F02%2Fhappy-woman-in-nature-at-sunset-860x487.jpg&imgrefurl=https%3A%2F%2Fwww.waca.associates%2Fen%2Fgrowthhacking%2Fkitnever-do-these-things-when-youre-a-single-person%2F&docid=AMiGDYOgUUhVLM&tbnid=FTeoJRmfnXg49M&vet=12ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECFkQAA..i&w=860&h=487&hcb=2&ved=2ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECFkQAA'
          ],
          title: 'Story 7'),
      Story(
          id: '8',
          imageUrls: [
            'https://www.google.com/imgres?q=single%20people%20images&imgurl=https%3A%2F%2Fthumbs.dreamstime.com%2Fb%2Fconfident-black-man-looking-camera-indoors-head-shot-young-handsome-portrait-african-american-single-bachelor-male-standing-128706411.jpg&imgrefurl=https%3A%2F%2Fwww.dreamstime.com%2Fphotos-images%2Fsingle-person.html&docid=slYa8UjhRo-nyM&tbnid=vJSiKCTEkDWrTM&vet=12ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECBsQAA..i&w=800&h=534&hcb=2&ved=2ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECBsQAA',
            'https://www.google.com/imgres?q=single%20people%20images&imgurl=https%3A%2F%2Fcdn2.psychologytoday.com%2Fassets%2Fstyles%2Fmanual_crop_1_91_1_1528x800%2Fpublic%2Ffield_blog_entry_images%2Fshutterstock_193527755.jpg%3Fitok%3DuS1VIBoY&imgrefurl=https%3A%2F%2Fwww.psychologytoday.com%2Fgb%2Fblog%2Fliving-single%2F201305%2Fare-single-people-mentally-stronger&docid=8Eebna8sJvnjDM&tbnid=JZMWHV0peAgXrM&vet=12ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECFoQAA..i&w=1528&h=800&hcb=2&ved=2ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECFoQAA'
          ],
          title: 'Story 8'),
      Story(
          id: '9',
          imageUrls: [
            'https://www.google.com/imgres?q=single%20people%20images&imgurl=https%3A%2F%2Fwendyspeaks.com%2Fwp-content%2Fuploads%2F2018%2F06%2Frawpixel-658258-unsplash-1024x907.jpg&imgrefurl=https%3A%2F%2Fwendyspeaks.com%2F10-life-changing-habits%2F&docid=KYoKvWU5W6gcpM&tbnid=RbG2roHRp3DUvM&vet=12ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECGUQAA..i&w=1024&h=907&hcb=2&ved=2ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECGUQAA',
            'https://www.google.com/imgres?q=single%20people%20images&imgurl=https%3A%2F%2Fwww.waca.associates%2Fen%2Fwp-content%2Fuploads%2F2021%2F02%2Fhappy-woman-in-nature-at-sunset-860x487.jpg&imgrefurl=https%3A%2F%2Fwww.waca.associates%2Fen%2Fgrowthhacking%2Fkitnever-do-these-things-when-youre-a-single-person%2F&docid=AMiGDYOgUUhVLM&tbnid=FTeoJRmfnXg49M&vet=12ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECFkQAA..i&w=860&h=487&hcb=2&ved=2ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECFkQAA'
          ],
          title: 'Story 9'),
      Story(
          id: '10',
          imageUrls: [
            'https://www.google.com/imgres?q=single%20people%20images&imgurl=https%3A%2F%2Fthumbs.dreamstime.com%2Fb%2Fconfident-black-man-looking-camera-indoors-head-shot-young-handsome-portrait-african-american-single-bachelor-male-standing-128706411.jpg&imgrefurl=https%3A%2F%2Fwww.dreamstime.com%2Fphotos-images%2Fsingle-person.html&docid=slYa8UjhRo-nyM&tbnid=vJSiKCTEkDWrTM&vet=12ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECBsQAA..i&w=800&h=534&hcb=2&ved=2ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECBsQAA',
            'https://www.google.com/imgres?q=single%20people%20images&imgurl=https%3A%2F%2Fcdn2.psychologytoday.com%2Fassets%2Fstyles%2Fmanual_crop_1_91_1_1528x800%2Fpublic%2Ffield_blog_entry_images%2Fshutterstock_193527755.jpg%3Fitok%3DuS1VIBoY&imgrefurl=https%3A%2F%2Fwww.psychologytoday.com%2Fgb%2Fblog%2Fliving-single%2F201305%2Fare-single-people-mentally-stronger&docid=8Eebna8sJvnjDM&tbnid=JZMWHV0peAgXrM&vet=12ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECFoQAA..i&w=1528&h=800&hcb=2&ved=2ahUKEwi2nf-Lx_aGAxUVTmwGHUKsBasQM3oECFoQAA'
          ],
          title: 'Story 10'),
      // Add more stories as needed
    ];
  }
}
