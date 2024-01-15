import { Component, OnInit} from '@angular/core';
import { select, Store } from '@ngrx/store';
import { Subscription } from 'rxjs';
import { selectUnsavedChanges } from './store/colors/color.selector';
import unsavedChanges from '../../../../../../../../../src/assets/js/components/rsthemes/unsaved-changes';
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent implements OnInit {
  title = 'colors';
  unsavedChanges: any;

  constructor(
    private store: Store,
  ) {
  }

  ngOnInit(): void {
    // this.initUnsavedChangesModal()
  }

  initUnsavedChangesModal(){
    this.store.pipe(select(selectUnsavedChanges)).subscribe(unsavedChangesExist => {
      if (unsavedChangesExist && !this.unsavedChanges) {
        this.unsavedChanges = new unsavedChanges()
        this.unsavedChanges.bindEvents()
      } else if(!unsavedChangesExist && this.unsavedChanges ) {
        this.unsavedChanges.unbindEvents()
      }
    })
  }
}

